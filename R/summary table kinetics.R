library(dplyr)
library(tidyr)

# 1. Extract summary info
summary_table <- lapply(names(results), function(ds_name) {
  res <- results[[ds_name]]
  tibble(
    Dataset = ds_name,
    Component = datasets[[ds_name]],
    k_RT = round(res$k_RT_pct, 2),
    k_8C = round(res$k_8C_pct, 2),
    p_val = signif(res$p_val, 3)
  )
}) %>% bind_rows()

# 2. Define categories
categories <- list(
  "Aventhramides" = c("oat_ave_total", "biloat_ave_total",
                      "oat_b1_ave_total", "biloat_b1_ave_total",
                      "oat_b2_ave_total", "biloat_b2_ave_total"),
  "Anthocyanins" = c("bilpow_acn", "bil_acn", "biloat_acn",
                     "bilpow_b1_acn", "bil_b1_acn", "biloat_b1_acn",
                     "bilpow_b2_acn", "bil_b2_acn", "biloat_b2_acn"),
  "Total Phenols" = c("bilpow_tp", "bil_tp", "biloat_tp", "oat_tp",
                      "bilpow_b1_tp", "bil_b1_tp", "biloat_b1_tp", "oat_b1_tp",
                      "bilpow_b2_tp", "bil_b2_tp", "biloat_b2_tp", "oat_b2_tp")
)

# 3. Assign category
summary_table <- summary_table %>%
  mutate(Category = case_when(
    Dataset %in% categories$Aventhramides ~ "Aventhramides",
    Dataset %in% categories$Anthocyanins ~ "Anthocyanins",
    Dataset %in% categories$`Total Phenols` ~ "Total Phenols",
    TRUE ~ "Other"
  ))

# 4. Separate Drink and Batch from Dataset
summary_table <- summary_table %>%
  separate(Dataset, into = c("Drink","Batch","_extra"), sep = "_", fill = "right") %>%
  mutate(
    Batch = ifelse(is.na(Batch), "main", Batch),
    Significant = ifelse(p_val < 0.05, "Yes", "No")
  ) %>%
  select(Category, Drink, Batch, Component, k_RT, k_8C, p_val, Significant) %>%
  arrange(Category, Drink, Batch)

# 5. Print combined table
summary_table

install.packages("writexl")  # only need to run once
library(writexl)

# summary_table is your combined table from earlier
write_xlsx(summary_table, path = "Degradation_Summary.xlsx")

getwd()
