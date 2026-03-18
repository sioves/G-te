library(ggplot2)
library(dplyr)

# -----------------------------
# 1. Prepare bilpow_acn data
# -----------------------------
bilpow_acn_clean <- bilpow_acn %>%
  mutate(
    # Convert time to numeric weeks
    time_weeks = case_when(
      Time == "0"  ~ 0,
      Time == "4W" ~ 4,
      Time == "3M" ~ 12,
      Time == "8M" ~ 32
    ),
    # Define groups for modeling (exclude baseline "O")
    group = case_when(
      Temperature == "RT" ~ "RT",
      Temperature == "8C" ~ "8C",
      TRUE ~ NA_character_
    )
  )

# -----------------------------
# 2. Extract baseline from data
# -----------------------------
C0 <- bilpow_acn_clean %>%
  filter(time_weeks == 0) %>%
  summarise(C0 = mean(Value)) %>%
  pull(C0)

# -----------------------------
# 3. Prepare modeling dataset (exclude baseline)
# -----------------------------
data_model <- bilpow_acn_clean %>%
  filter(time_weeks > 0) %>%
  mutate(group = factor(group),
         lnC = log(Value / C0))

# -----------------------------
# 4. Fit first-order model
# -----------------------------
model <- lm(lnC ~ 0 + time_weeks + time_weeks:group, data = data_model)
coef_vals <- coef(model)

k_RT <- -coef_vals["time_weeks"]
k_8C <- -(coef_vals["time_weeks"] + coef_vals["time_weeks:group8C"])
p_val <- summary(model)$coefficients["time_weeks:group8C","Pr(>|t|)"]

k_RT_pct <- k_RT * 100
k_8C_pct <- k_8C * 100

# -----------------------------
# 5. Prediction grid
# -----------------------------
t_seq <- seq(0, 32, length.out = 100)

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

# Clean predictions for geom_ribbon to avoid NAs
pred_ln <- pred_ln %>%
  filter(!is.na(C_lower) & !is.na(C_upper)) %>%
  mutate(
    group = factor(group, levels = c("RT","8C")),
    time_weeks = as.numeric(time_weeks)
  )

# -----------------------------
# 6. Baseline for plotting
# -----------------------------
baseline <- bilpow_acn_clean %>%
  filter(time_weeks == 0) %>%
  mutate(
    lnC = 0
  )

# Duplicate baseline for both groups (needed for plotting)
baseline_plot <- rbind(
  baseline %>% mutate(group = "RT"),
  baseline %>% mutate(group = "8C")
)

data_plot <- data_model

# -----------------------------
# 7. Plot 1: ln(C/C0)
# -----------------------------
p1 <- ggplot() +

  geom_point(data = baseline_plot,
             aes(time_weeks, lnC, color = group),
             size = 3) +

  geom_point(data = data_plot,
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

  annotate("text", x = 18, y = -0.20,
           label = paste0("k (RT) = ", round(k_RT_pct,2), " %/week"),
           color = "#0072B2", hjust = 0, size = 3) +

  annotate("text", x = 18, y = -0.07,
           label = paste0("k (8°C) = ", round(k_8C_pct,2), " %/week"),
           color = "#D55E00", hjust = 0, size = 3) +

  annotate("text", x = 10, y = -0.15,
           label = paste0("p = ", signif(p_val, 5)),
           size = 3) +

  labs(title = "Bilberry powder anthocyanins: First-order degradation kinetics",
       x = "Time (weeks)",
       y = "ln(C/C₀)",
       color = "Storage",
       fill = "Storage") +

  theme_classic(base_size = 12) +
  theme(legend.position = c(0.85,0.85),
        legend.background = element_blank())

# -----------------------------
# 8. Plot 2: Concentration vs time
# -----------------------------
# Means for plotting
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

  labs(title = "Bilberry powder anthocyanins: Concentration vs time",
       x = "Time (weeks)",
       y = "Concentration",
       color = "Storage",
       fill = "Storage") +

  theme_classic(base_size = 12) +
  theme(legend.position = c(0.85,0.85),
        legend.background = element_blank())

# -----------------------------
# 9. Show plots
# -----------------------------
print(p1)
print(p2)
