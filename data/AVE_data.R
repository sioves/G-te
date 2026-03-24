#Total aventhramides data frame based on the sum of aveA, B and C

library(dplyr)

# Combines ave a, b and c and sums values
sum_ave <- function(dfs) {
  bind_rows(dfs) %>%
    group_by(Temperature, Time, Replicate) %>%
    summarise(Value = sum(Value), .groups = "drop")
}

# =======================
# Pilot
# =======================
# Oat drink Pilot
oat_ave_all <- bind_rows(oat_ave_a, oat_ave_b, oat_ave_c)
oat_ave_total <- sum_ave(list(oat_ave_a, oat_ave_b, oat_ave_c))

# Bilberry-Oat drink Pilot
biloat_ave_all <- bind_rows(biloat_ave_a, biloat_ave_b, biloat_ave_c)
biloat_ave_total <- sum_ave(list(biloat_ave_a, biloat_ave_b, biloat_ave_c))

# =======================
# Batch 1
# =======================
# Oat drink Batch 1
oat_b1_ave_all <- bind_rows(oat_b1_ave_a, oat_b1_ave_b, oat_b1_ave_c)
oat_b1_ave_total <- sum_ave(list(oat_b1_ave_a, oat_b1_ave_b, oat_b1_ave_c))

# Bilberry-Oat drink Batch 1
biloat_b1_ave_all <- bind_rows(biloat_b1_ave_a, biloat_b1_ave_b, biloat_b1_ave_c)
biloat_b1_ave_total <- sum_ave(list(biloat_b1_ave_a, biloat_b1_ave_b, biloat_b1_ave_c))

# =======================
# Batch 2
# =======================
# Oat drink Batch 2
oat_b2_ave_all <- bind_rows(oat_b2_ave_a, oat_b2_ave_b, oat_b2_ave_c)
oat_b2_ave_total <- sum_ave(list(oat_b2_ave_a, oat_b2_ave_b, oat_b2_ave_c))

# Bilberry-Oat drink Batch 2
biloat_b2_ave_all <- bind_rows(biloat_b2_ave_a, biloat_b2_ave_b, biloat_b2_ave_c)
biloat_b2_ave_total <- sum_ave(list(biloat_b2_ave_a, biloat_b2_ave_b, biloat_b2_ave_c))

