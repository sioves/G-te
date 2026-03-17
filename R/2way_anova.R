
#2-way ANOVA testing temperature, time and interaction between temperature + time.
anova_bilpow_acn <- aov(Value ~ Temperature * Time, data = bilpow_acn)
summary(anova_bilpow_acn)

# Normal destribution of residuals
shapiro.test(residuals(anova_bilpow_acn))

# Homogen variance
plot(anova_bilpow_acn, 1)  # Residuals vs Fitted

# Tukey HSD for multiple comparisons
TukeyHSD(anova_bilpow_acn)
