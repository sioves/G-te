#Define fucntion 2-way ANOVA
anova <- function(data, value_col, temp_col, time_col,
                               temp_levels = c("O","RT","8C"),
                               time_levels = c("0","4W","3M","8M")) {

#Temperature and Time set to catagorical factors
  data[[temp_col]] <- factor(data[[temp_col]], levels = temp_levels)
  data[[time_col]] <- factor(data[[time_col]], levels = time_levels)

  # Construct the model formula programmatically using the specified variable names.
  # The "*" operator specifies a two-way ANOVA including:
  # (1) the main effect of temperature,
  # (2) the main effect of time, and
  # (3) the interaction between temperature and time.
  formula <- as.formula(paste(value_col, "~", temp_col, "*", time_col))

  # Fit the two-way ANOVA model.
  # This model evaluates whether mean differences in the outcome variable are associated with temperature, time, and their interaction.
  model <- aov(formula, data = data)
  # Display the ANOVA table, including F-statistics and p-values for each main effect and the interaction term.
  cat("\n--- ANOVA summary ---\n")
  print(summary(model))

  # Perform Shapiro–Wilk test on model residuals to assess the assumption of normality of the error terms
  cat("\n--- Shapiro-Wilk test ---\n")
  print(shapiro.test(residuals(model)))

  # Conduct Tukey’s Honest Significant Difference (HSD) test for post hoc pairwise comparisons between factor levels
  cat("\n--- Tukey HSD ---\n")
  print(TukeyHSD(model))

  # Generate a diagnostic plot of residuals versus fitted values to visually assess homogeneity of variance
  plot(model, 1)

  # Return the fitted model object to allow generation of additional plots outside the function.
  return(model)
}
#Bilberry powder
anova_bilpow_acn <- anova(
  data = bilpow_acn,
  value_col = "Value",
  temp_col = "Temperature",
  time_col = "Time"
)

#Bilberry drink
anova_bil_acn <- anova(
  data = bil_acn,
  value_col = "Value",
  temp_col = "Temperature",
  time_col = "Time"
)

#Bilberry oat drink
biloat_acn <- anova(
  data = bil_acn,
  value_col = "Value",
  temp_col = "Temperature",
  time_col = "Time"
)
