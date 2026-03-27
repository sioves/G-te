anova <- function(data, value_col, temp_col, time_col,
                  temp_levels = NULL, time_levels = NULL) {

  # Dynamically detect temperature levels if not provided
  if (is.null(temp_levels)) {
    temp_levels <- unique(data[[temp_col]])
  }
  data[[temp_col]] <- factor(data[[temp_col]], levels = temp_levels)

  # Dynamically detect time levels if not provided
  if (is.null(time_levels)) {
    time_levels <- unique(data[[time_col]])
  }
  data[[time_col]] <- factor(data[[time_col]], levels = time_levels)

  # Construct model formula
  formula <- as.formula(paste(value_col, "~", temp_col, "*", time_col))

  # Fit the two-way ANOVA model
  model <- aov(formula, data = data)

  # Display ANOVA summary
  cat("\n--- ANOVA summary ---\n")
  print(summary(model))

  # Shapiro-Wilk test on residuals
  cat("\n--- Shapiro-Wilk test ---\n")
  print(shapiro.test(residuals(model)))

  # Tukey HSD post-hoc test
  cat("\n--- Tukey HSD ---\n")
  print(TukeyHSD(model))

  # Residuals vs fitted plot
  plot(model, 1)

  # Return model
  return(model)
}

# ACN
#pilot
anova_bilpow_acn <- anova(bilpow_acn, "Value", "Temperature", "Time")
anova_bil_acn    <- anova(bil_acn, "Value", "Temperature", "Time")
anova_biloat_acn <- anova(biloat_acn, "Value", "Temperature", "Time")
#B1
anova_bilpow_b1_acn <- anova(bilpow_b1_acn, "Value", "Temperature", "Time")
anova_bil_b1_acn    <- anova(bil_b1_acn, "Value", "Temperature", "Time")
anova_biloat_b1_acn <- anova(biloat_b1_acn, "Value", "Temperature", "Time")
#B2
anova_bilpow_b2_acn <- anova(bilpow_b2_acn, "Value", "Temperature", "Time")
anova_bil_b2_acn    <- anova(bil_b2_acn, "Value", "Temperature", "Time")
anova_biloat_b2_acn <- anova(biloat_b2_acn, "Value", "Temperature", "Time")

# TP
#pilot
anova_bilpow_tp  <- anova(bilpow_tp, "Value", "Temperature", "Time")
anova_bil_tp     <- anova(bil_tp, "Value", "Temperature", "Time")
anova_oat_tp     <- anova(oat_tp, "Value", "Temperature", "Time")
anova_biloat_tp  <- anova(biloat_tp, "Value", "Temperature", "Time")
#B1
anova_bilpow_b1_tp  <- anova(bilpow_b1_tp, "Value", "Temperature", "Time")
anova_bil_b1_tp     <- anova(bil_b1_tp, "Value", "Temperature", "Time")
anova_oat_b1_tp     <- anova(oat_b1_tp, "Value", "Temperature", "Time")
anova_biloat_b1_tp  <- anova(biloat_b1_tp, "Value", "Temperature", "Time")
#B2
anova_bilpow_b2_tp  <- anova(bilpow_b2_tp, "Value", "Temperature", "Time")
anova_bil_b2_tp     <- anova(bil_b2_tp, "Value", "Temperature", "Time")
anova_oat_b2_tp     <- anova(oat_b2_tp, "Value", "Temperature", "Time")
anova_biloat_b2_tp  <- anova(biloat_b2_tp, "Value", "Temperature", "Time")

# AVE oat drink
#pilot
anova_oat_ave_total <- anova(biloat_ave_total, "Value", "Temperature", "Time")
anova_biloat_ave_total <- anova(biloat_ave_total, "Value", "Temperature", "Time")
#B1
anova_oat_b1_ave_total <- anova(biloat_b1_ave_total, "Value", "Temperature", "Time")
anova_biloat_b1_ave_total <- anova(biloat_b1_ave_total, "Value", "Temperature", "Time")
#B2
anova_oat_b2_ave_total <- anova(biloat_b2_ave_total, "Value", "Temperature", "Time")
anova_biloat_b2_ave_total <- anova(biloat_b2_ave_total, "Value", "Temperature", "Time")
