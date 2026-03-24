#___________________________
#PILOT
#___________________________

#units: mg/g

# Bilberry powder
bilpow_acn <- data.frame(
  Temperature = c(
    "O", "O",
    "RT", "RT", "RT", "RT", "RT", "RT",
    "8C", "8C", "8C", "8C", "8C", "8C"
  ),
  Time = c(
    "0", "0",
    "4W", "4W", "3M", "3M", "8M", "8M",
    "4W", "4W", "3M", "3M", "8M", "8M"
  ),
  Value = c(
    4.28, 4.35,
    4.03, 3.89, 4.09, 3.88, 3.38, 3.33,
    3.95, 3.85, 3.88, 3.92, 3.73, 3.78
  ),
  Replicate = rep(1:2, 7)
)


# Bilberry drink
bil_acn <- data.frame(
  Temperature = c(
    "O", "O",
    "RT", "RT", "RT", "RT", "RT", "RT",
    "8C", "8C", "8C", "8C", "8C", "8C"
  ),
  Time = c(
    "0", "0",
    "4W", "4W", "3M", "3M", "8M", "8M",
    "4W", "4W", "3M", "3M", "8M", "8M"
  ),
  Value = c(
    4.65, 4.44,
    4.11, 3.72, 3.25, 2.81, 2.70, 2.79,
    4.22, 4.75, 3.65, 3.83, 3.91, 4.10
  ),
  Replicate = rep(1:2, 7)
)

# Bilberry Oat drink
biloat_acn <- data.frame(
  Temperature = c(
    "O", "O",
    "RT", "RT", "RT", "RT", "RT", "RT",
    "8C", "8C", "8C", "8C", "8C", "8C"
  ),
  Time = c(
    "0", "0",
    "4W", "4W", "3M", "3M", "8M", "8M",
    "4W", "4W", "3M", "3M", "8M", "8M"
  ),
  Value = c(
    1.59, 1.38,
    1.04, 1.49, 0.91, 0.92, 0.48, 0.54,
    1.29, 1.47, 1.28, 1.42, 1.24, 1.32
  ),
  Replicate = rep(1:2, 7)
)



#___________________________
#BATCH 1
#___________________________

#units ug/g
# Bilberry Powder Batch 1
#4C?
bilpow_b1_acn <- data.frame(
  Temperature = c(
    rep("RT", 3),           # RT 0
    rep("8C", 3),           # 8C 0
    rep("RT", 2*3),         # RT 2 timepoints × 3 replicates
    rep("8C", 2*3)          # 8C 2 timepoints × 3 replicates
  ),
  Time = c(
    rep("0", 3),  # RT 0
    rep("0", 3),  # 8C 0
    rep(c("24W","48W"), each = 3), # RT
    rep(c("24W","48W"), each = 3)  # 8C
  ),
  Replicate = rep(1:3, times = 2 + 2*2),  # 3 replicates for each
  Value = c(
    # RT 0
    137.2175837, 136.2078252, 121.4646224,
    # 8C 0
    137.2175837, 129.3278613, 121.9002396,
    # RT 24W-48W
    119.4732255, 126.0291541, 106.4160421,
    104.0126083, 109.6206138, 96.15992112,
    # 8C 24W-48W
    129.5054859, 129.8848922, 119.1157235,
    127.7903555, 131.0948679, 116.7591168
  )
)


# -----------------------------
# Bilberry Drink Batch 1
# -----------------------------
bil_b1_acn <- data.frame(
  Temperature = c(
    rep("RT", 3),           # RT 0
    rep("8C", 3),           # 8C 0
    rep("RT", 5*3),         # RT 5 timepoints × 3 replicates
    rep("8C", 5*3)          # 8C 5 timepoints × 3 replicates
  ),
  Time = c(
    rep("0", 3),  # RT 0
    rep("0", 3),  # 8C 0
    rep(c("4W","12W","24W","32W","48W"), each = 3), # RT
    rep(c("4W","12W","24W","32W","48W"), each = 3)  # 8C
  ),
  Replicate = rep(1:3, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    437.5309623, 411.0324475, 351.9768059,
    # 8C 0
    431.1837028, 398.9088831, 393.5721135,
    # RT 4W-48W
    299.9570774, 277.5064339, 215.647062,
    244.2407681, 227.937252, 214.841407,
    243.6675276, 226.4199257, 204.3228438,
    161.7197393, 164.3494352, 146.7891602,
    144.6328847, 185.8437327, 129.460788,
    # 8C 4W-48W
    428.2546818, 430.9206474, 383.9102934,
    377.9846999, 386.979922, 361.0959271,
    338.174687, 346.3445446, 296.3090417,
    294.0618166, 295.9036364, 264.3775931,
    342.8258209, 358.606914, 318.1814957
  )
)



# -----------------------------
# Bilberry-Oat Drink Batch 1
# -----------------------------
biloat_b1_acn <- data.frame(
  Temperature = c(
    rep("RT", 3),           # RT 0
    rep("8C", 3),           # 8C 0
    rep("RT", 5*3),         # RT 5 timepoints × 3 replicates
    rep("8C", 5*3)          # 8C 5 timepoints × 3 replicates
  ),
  Time = c(
    rep("0", 3),  # RT 0
    rep("0", 3),  # 8C 0
    rep(c("4W","12W","24W","32W","48W"), each = 3), # RT
    rep(c("4W","12W","24W","32W","48W"), each = 3)  # 8C
  ),
  Replicate = rep(1:3, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    71.47814172, 76.60982696, 68.77714979,
    # 8C 0
    75.72773398, 81.45242032, 69.02322189,
    # RT 4W-48W
    64.739673, 65.80646005, 62.26387522,
    56.8761858, 56.85286939, 52.21605312,
    47.26084505, 31.1657849, 30.21919417,
    30.11036986, 21.09115577, 20.08739254,
    19.48652372, 15.41538243, 16.97870751,
    # 8C 4W-48W
    68.36559106, 61.13966321, 61.67519907,
    71.51132953, 69.64293733, 64.46888988,
    58.1041406, 62.56778095, 51.94429837,
    50.93251825, 47.21835239, 42.99635237,
    55.83872961, 55.04760623, 49.98126269
  )
)



#___________________________
#BATCH 2
#___________________________

#units ug/g
# Bilberry Powder Batch 2
#4C?
bilpow_b2_acn <- data.frame(
  Temperature = c(
    rep("RT", 3),           # RT 0
    rep("8C", 3),           # 8C 0
    rep("RT", 2*3),         # RT 2 timepoints × 3 replicates
    rep("8C", 2*3)          # 8C 2 timepoints × 3 replicates
  ),
  Time = c(
    rep("0", 3),  # RT 0
    rep("0", 3),  # 8C 0
    rep(c("24W","48W"), each = 3), # RT
    rep(c("24W","48W"), each = 3)  # 8C
  ),
  Replicate = rep(1:3, times = 2 + 2*2),  # 3 replicates for each
  Value = c(
    # RT 0
    89.78411516, 90.83602925, 80.49085467,
    # 8C 0
    89.78411516, 92.58521195, 88.95993255,
    # RT 24W-48W
    63.39576776, 62.57549225, 56.30304083,
    53.56817573, 55.3612878, 47.10017058,
    # 8C 24W-48W
    89.1828703, 94.56111114, 87.74211384,
    71.97142641, 74.00992025, 74.79753211
  )
)


# Bilberry Drink Batch 2
#4C?
bil_b2_acn <- data.frame(
  Temperature = c(
    rep("RT", 3),           # RT 0
    rep("8C", 3),           # 8C 0
    rep("RT", 2*3),         # RT 2 timepoints × 3 replicates
    rep("8C", 2*3)          # 8C 2 timepoints × 3 replicates
  ),
  Time = c(
    rep("0", 3),  # RT 0
    rep("0", 3),  # 8C 0
    rep(c("24W","48W"), each = 3), # RT
    rep(c("24W","48W"), each = 3)  # 8C
  ),
  Replicate = rep(1:3, times = 2 + 2*2),  # 3 replicates for each
  Value = c(
    # RT 0
    269.026871, 255.9646608, 244.1811196,
    # 8C 0
    269.026871, 258.186927, 232.2228025,
    # RT 24W-48W
    81.16058767, 152.5147662, 74.24038231,
    46.73595693, 23.54489757, 24.98554632,
    # 8C 24W-48W
    206.2666487, 206.9817363, 185.213945,
    212.1527765, 211.7743188, 190.9939234
  )
)


# Bilberry-Oat Drink Batch 2
#4C?
biloat_b2_acn <- data.frame(
  Temperature = c(
    rep("RT", 3),           # RT 0
    rep("8C", 3),           # 8C 0
    rep("RT", 2*3),         # RT 2 timepoints × 3 replicates
    rep("8C", 2*3)          # 8C 2 timepoints × 3 replicates
  ),
  Time = c(
    rep("0", 3),  # RT 0
    rep("0", 3),  # 8C 0
    rep(c("24W","48W"), each = 3), # RT
    rep(c("24W","48W"), each = 3)  # 8C
  ),
  Replicate = rep(1:3, times = 2 + 2*2),  # 3 replicates for each
  Value = c(
    # RT 0
    91.21126994, 91.47182055, 82.98002172,
    # 8C 0
    91.21126994, 86.0702212, 79.97833284,
    # RT 24W-48W
    26.97541249, 26.50859775, 23.10099417,
    18.80957092, 18.68708446, 15.59295663,
    # 8C 24W-48W
    70.00525378, 70.32555038, 64.09933414,
    43.86355095, 43.79272424, 39.2882106
  )
)
