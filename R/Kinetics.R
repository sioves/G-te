library(ggplot2)
library(dplyr)

# -----------------------------
# Generic first-order degradation plotting function
# -----------------------------
plot_degradation <- function(data, component_name) {

  # 1. Clean data
  data_clean <- data %>%
    mutate(
      time_weeks = case_when(
        Time %in% c("0", "O") ~ 0,
        Time == "4W"  ~ 4,
        Time == "12W" ~ 12,
        Time == "24W" ~ 24,
        Time == "32W" ~ 32,
        Time == "36W" ~ 36,
        Time == "48W" ~ 48,
        Time == "51W" ~ 51,
        Time == "3M"  ~ 12,
        Time == "8M"  ~ 32,
        TRUE ~ NA_real_
      ),
      group = case_when(
        Temperature == "RT" ~ "RT",
        Temperature == "8C" ~ "8C",
        TRUE ~ NA_character_
      )
    ) %>%
    filter(!is.na(time_weeks), !is.na(Value))

  # 2. Baseline C0
  C0 <- data_clean %>%
    filter(time_weeks == 0) %>%
    summarise(C0 = mean(Value, na.rm = TRUE)) %>%
    pull(C0)

  # 3. Modeling dataset
  data_model <- data_clean %>%
    filter(time_weeks > 0) %>%
    mutate(group = factor(group),
           lnC = log(Value / C0))

  # 4. Fit first-order model
  model <- lm(lnC ~ 0 + time_weeks + time_weeks:group, data = data_model)
  coef_vals <- coef(model)

  k_RT <- -coef_vals["time_weeks"]
  k_8C <- -(coef_vals["time_weeks"] + coef_vals["time_weeks:group8C"])
  p_val <- summary(model)$coefficients["time_weeks:group8C","Pr(>|t|)"]

  k_RT_pct <- k_RT * 100
  k_8C_pct <- k_8C * 100

  # 5. Prediction grid
  t_seq <- seq(0, max(data_clean$time_weeks, na.rm = TRUE), length.out = 100)
  pred_ln <- expand.grid(
    time_weeks = t_seq,
    group = c("RT","8C")
  )
  pred <- predict(model, newdata = pred_ln, se.fit = TRUE)

  pred_ln$lnC <- pred$fit
  pred_ln$se <- pred$se.fit
  pred_ln$upper <- pred_ln$lnC + 1.96 * pred_ln$se
  pred_ln$lower <- pred_ln$lnC - 1.96 * pred_ln$se
  pred_ln$C_pred  <- C0 * exp(pred_ln$lnC)
  pred_ln$C_upper <- C0 * exp(pred_ln$upper)
  pred_ln$C_lower <- C0 * exp(pred_ln$lower)

  pred_ln <- pred_ln %>%
    filter(!is.na(C_lower) & !is.na(C_upper)) %>%
    mutate(group = factor(group, levels = c("RT","8C")),
           time_weeks = as.numeric(time_weeks))

  # 6. Baseline for plotting
  baseline <- data_clean %>%
    filter(time_weeks == 0) %>%
    mutate(lnC = 0)
  baseline_plot <- rbind(
    baseline %>% mutate(group = "RT"),
    baseline %>% mutate(group = "8C")
  )

  # 7. Plot ln(C/C0)
  p1 <- ggplot() +
    geom_point(data = baseline_plot,
               aes(time_weeks, lnC, color = group),
               size = 3) +
    geom_point(data = data_model,
               aes(time_weeks, lnC, color = group),
               size = 3,
               position = position_jitter(width = 0.6, height = 0)) +
    geom_line(data = pred_ln,
              aes(time_weeks, lnC, color = group),
              linewidth = 1,
              linetype = "dashed") +
    geom_ribbon(data = pred_ln,
                aes(x = time_weeks, ymin = lower, ymax = upper, fill = group),
                alpha = 0.2, colour = NA) +
    scale_color_manual(values = c("RT"="#0072B2", "8C"="#D55E00")) +
    scale_fill_manual(values = c("RT"="#0072B2", "8C"="#D55E00")) +
    annotate("text", x = max(data_clean$time_weeks)/2, y = -0.2,
             label = paste0("k (RT) = ", round(k_RT_pct,2), " %/week"),
             color = "#0072B2", hjust = 0, size = 3) +
    annotate("text", x = max(data_clean$time_weeks)/2, y = -0.07,
             label = paste0("k (8°C) = ", round(k_8C_pct,2), " %/week"),
             color = "#D55E00", hjust = 0, size = 3) +
    annotate("text", x = max(data_clean$time_weeks)/3, y = -0.15,
             label = paste0("p = ", signif(p_val, 5)),
             size = 3) +
    labs(title = paste(component_name, ": First-order degradation kinetics"),
         x = "Time (weeks)",
         y = expression(ln(C/C[0])),
         color = "Storage",
         fill = "Storage") +
    theme_classic(base_size = 12) +
    theme(legend.position = c(0.85,0.85),
          legend.background = element_blank())

  # 8. Plot Concentration vs time
  data_mean <- data_model %>%
    group_by(group, time_weeks) %>%
    summarise(C_mean = mean(Value), .groups = "drop")
  baseline_mean <- data.frame(
    group = c("RT","8C"),
    time_weeks = 0,
    C_mean = C0
  )
  data_mean_plot <- rbind(baseline_mean, data_mean)

  p2 <- ggplot() +
    geom_point(data = data_mean_plot,
               aes(time_weeks, C_mean, color = group),
               size = 3) +
    geom_line(data = data_mean_plot,
              aes(time_weeks, C_mean, color = group),
              linewidth = 1) +
    geom_line(data = pred_ln,
              aes(time_weeks, C_pred, color = group),
              linewidth = 0.5, linetype = "dashed") +
    geom_ribbon(data = pred_ln,
                aes(x = time_weeks, ymin = C_lower, ymax = C_upper, fill = group),
                alpha = 0.2, colour = NA) +
    scale_color_manual(values = c("RT"="#0072B2", "8C"="#D55E00")) +
    scale_fill_manual(values = c("RT"="#0072B2", "8C"="#D55E00")) +
    expand_limits(y = 0) +
    labs(title = paste(component_name, ": Concentration vs time"),
         x = "Time (weeks)",
         y = "Concentration",
         color = "Storage",
         fill = "Storage") +
    theme_classic(base_size = 12) +
    theme(legend.position = c(0.85,0.85),
          legend.background = element_blank())

  # Return results
  list(
    model = model,
    k_RT_pct = k_RT_pct,
    k_8C_pct = k_8C_pct,
    p_val = p_val,
    plot_lnC = p1,
    plot_C = p2
  )
}


# -----------------------------
# Datasets list
# -----------------------------
datasets <- list(
  bilpow_tp    = "Bilberry Powder Total Phenols (mg/g)",
  bil_tp       = "Bilberry Drink Total Phenols (mg/g)",
  biloat_tp    = "Bilberry-Oat Drink Total Phenols (mg/g)",
  oat_tp       = "Oat Drink Total Phenols (mg/g)",

  bilpow_acn    = "Bilberry Powder Anthocyanins (mg/g)",
  bil_acn       = "Bilberry Drink Anthocyanins (mg/g)",
  biloat_acn    = "Bilberry-Oat Drink Anthocyanins (mg/g)",

  oat_ave_total    = "Oat Drink Aventhramides (ug/g)",
  biloat_ave_total    = "Bilberry-Oat Aventhramides (ug/g)",

  bilpow_b1_tp = "Bilberry Powder B1 Total Phenols (mg/g)",
  bil_b1_tp    = "Bilberry Drink B1 Total Phenols (mg/g)",
  biloat_b1_tp = "Bilberry-Oat Drink B1 Total Phenols (mg/g)",
  oat_b1_tp    = "Oat Drink B1 Total Phenols (mg/g)",

  bilpow_b1_acn    = "Bilberry Powder B1 Anthocyanins (ug/g)",
  bil_b1_acn       = "Bilberry Drink B1 Anthocyanins (ug/g)",
  biloat_b1_acn    = "Bilberry-Oat Drink B1 Anthocyanins (ug/g)",

  oat_b1_ave_total    = "Oat Drink B1 Aventhramides (ug/g)",
  biloat_b1_ave_total    = "Bilberry-Oat B1 Aventhramides (ug/g)",

  bilpow_b2_tp = "Bilberry Powder B2 Total Phenols (mg/g)",
  bil_b2_tp    = "Bilberry Drink B2 Total Phenols (mg/g)",
  biloat_b2_tp = "Bilberry-Oat Drink B2 Total Phenols (mg/g)",
  oat_b2_tp    = "Oat Drink B2 Total Phenols (mg/g)",

  bilpow_b2_acn    = "Bilberry Powder B2 Anthocyanins (ug/g)",
  bil_b2_acn       = "Bilberry Drink B2 Anthocyanins (ug/g)",
  biloat_b2_acn    = "Bilberry-Oat B2 Drink Anthocyanins (ug/g)",

  oat_b2_ave_total    = "Oat Drink B2 Aventhramides (ug/g)",
  biloat_b2_ave_total    = "Bilberry-Oat B2 Aventhramides (ug/g)"
)

# -----------------------------
# Apply function to all datasets
# -----------------------------
results <- lapply(names(datasets), function(ds_name) {
  plot_degradation(get(ds_name), datasets[[ds_name]])
})
names(results) <- names(datasets)

# -----------------------------
# Print all plots automatically
# -----------------------------
for (res_name in names(results)) {
  cat("\n--- Plots for dataset:", res_name, "---\n")
  print(results[[res_name]]$plot_C)
  print(results[[res_name]]$plot_lnC)
}


# -----------------------------
# Example on how to show plots induvidually
# -----------------------------
print(results$biloat_ave_total$plot_C)
print(results$biloat_ave_total$plot_lnC)

