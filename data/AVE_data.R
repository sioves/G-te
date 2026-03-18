#Total aventhramides data frame based on the sum of aveA, B and C

library(dplyr)

#Bilberry-Oat drink
# Combines all data frames
biloat_ave_all <- bind_rows(
  biloat_ave_a,
  biloat_ave_b,
  biloat_ave_c
)

# Sums up values for each unique combination of Temperature, Time og Replicate
biloat_ave_total <- biloat_ave_all %>%
  group_by(Temperature, Time, Replicate) %>%
  summarise(Value = sum(Value), .groups = "drop")


#Oat drink
# Combines all data frames
oat_ave_all <- bind_rows(
  oat_ave_a,
  oat_ave_b,
  oat_ave_c
)

# Sums up values for each unique combination of Temperature, Time og Replicate
oat_ave_total <- oat_ave_all %>%
  group_by(Temperature, Time, Replicate) %>%
  summarise(Value = sum(Value), .groups = "drop")

