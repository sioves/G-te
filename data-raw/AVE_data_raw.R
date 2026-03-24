#units: ug/g

#___________________________
#PILOT
#___________________________

# Oat drink
oat_ave_a <- data.frame(
  Temperature = c(
    "O", "O",
    "RT", "RT", "RT", "RT", "RT", "RT",
    "8C", "8C", "8C", "8C", "8C", "8C"
  ),
  Time = c(
    "0", "0",
    "4W", "4W", "12W", "12W", "32W", "32W",
    "4W", "4W", "12W", "12W", "32W", "32W"
  ),
  Value = c(
    22.9,  26.6,
    22.9, 27.5, 25.2, 21.3, 19.0, 22.9,
    22.7, 24.5, 21.7, 28.9, 20.7, 20.7
  ),
  Replicate = rep(1:2, 7)
)

oat_ave_b <- data.frame(
  Temperature = c(
    "O", "O",
    "RT", "RT", "RT", "RT", "RT", "RT",
    "8C", "8C", "8C", "8C", "8C", "8C"
  ),
  Time = c(
    "0", "0",
    "4W", "4W", "12W", "12W", "32W", "32W",
    "4W", "4W", "12W", "12W", "32W", "32W"
  ),
  Value = c(
    35.2, 43.6,
    36.0, 41.3, 42.2, 35.2, 31.4, 36.3,
    36.2, 37.9, 35.1, 45.0, 34.8, 34.8
  ),
  Replicate = rep(1:2, 7)
)

oat_ave_c <- data.frame(
  Temperature = c(
    "O", "O",
    "RT", "RT", "RT", "RT", "RT", "RT",
    "8C", "8C", "8C", "8C", "8C", "8C"
  ),
  Time = c(
    "0", "0",
    "4W", "4W", "12W", "12W", "32W", "32W",
    "4W", "4W", "12W", "12W", "32W", "32W"
  ),
  Value = c(
    51.1, 59.6,
    53.3, 63.5, 56.2, 47.4, 34.1, 40.2,
    52.1, 59.5, 51.2, 67.5, 48.3, 47.0
  ),
  Replicate = rep(1:2, 7)
)



# Bilberry-Oat drink
biloat_ave_a <- data.frame(
  Temperature = c(
    "O", "O",
    "RT", "RT", "RT", "RT", "RT", "RT",
    "8C", "8C", "8C", "8C", "8C", "8C"
  ),
  Time = c(
    "0", "0",
    "4W", "4W", "12W", "12W", "32W", "32W",
    "4W", "4W", "12W", "12W", "32W", "32W"
  ),
  Value = c(
    24.9,  25.0,
    21.2, 22.3, 18.5, 21.1, 10.6, 10.9,
    24.4, 23.2, 20.2, 20.3, 20.5, 18.3
  ),
  Replicate = rep(1:2, 7)
)

biloat_ave_b <- data.frame(
    Temperature = c(
      "O", "O",
      "RT", "RT", "RT", "RT", "RT", "RT",
      "8C", "8C", "8C", "8C", "8C", "8C"
    ),
    Time = c(
      "0", "0",
      "4W", "4W", "12W", "12W", "32W", "32W",
      "4W", "4W", "12W", "12W", "32W", "32W"
    ),
    Value = c(
      42.8, 45.3,
      36.7, 37.0, 31.6, 36.2, 19.1, 20.2,
      42.5, 41.0, 34.5, 33.5, 36.4, 33.3
    ),
    Replicate = rep(1:2, 7)
)

biloat_ave_c <- data.frame(
      Temperature = c(
        "O", "O",
        "RT", "RT", "RT", "RT", "RT", "RT",
        "8C", "8C", "8C", "8C", "8C", "8C"
      ),
      Time = c(
        "0", "0",
        "4W", "4W", "12W", "12W", "32W", "32W",
        "4W", "4W", "12W", "12W", "32W", "32W"
      ),
      Value = c(
        64.0, 66.1,
        57.0, 59.3, 51.8, 56.2, 30.9, 32.7,
        64.8, 63.2, 52.5, 52.9, 57.3, 50.4
      ),
      Replicate = rep(1:2, 7)
)


#___________________________
#BATCH 1
#___________________________


# -----------------------------
# Oat Drink Batch 1
# -----------------------------
oat_b1_ave_a <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 5*2),         # RT 5 timepoints × 2 replicates
    rep("8C", 5*2)          # 8C 5 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("4W","12W","24W","36W","51W"), each = 2), # RT
    rep(c("4W","12W","24W","36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    18.3246267, 17.1607771,
    # 8C 0
    17.28845126, 15.43162762,
    # RT 4W-51W
    14.4, 13.00973504,
    19.04896467, 17.71726724,
    17.67220524, 17.65559994,
    10.2927041, 9.976218011,
    9.203862536, 8.541373312,
    # 8C 4W-51W
    17.98585923, 15.49266708,
    16.1465661, 14.26163876,
    11.03580499, 11.76113451,
    14.97829437, 14.91500543,
    9.979654641, 8.624675909
  )
)


oat_b1_ave_b <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 5*2),         # RT 5 timepoints × 2 replicates
    rep("8C", 5*2)          # 8C 5 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("4W","12W","24W","36W","51W"), each = 2), # RT
    rep(c("4W","12W","24W","36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    58.67968138, 56.32748025,
    # 8C 0
    59.58775245, 53.1660009,
    # RT 4W-51W
    48.73326331, 38.3398142,
    59.28740706, 52.09480232,
    56.19164886, 49.73203752,
    36.49564691, 32.83628259,
    30.72492103, 29.63738271,
    # 8C 4W-51W
    61.68747128, 50.06905736,
    51.99128406, 44.02369178,
    42.0275209, 39.75038381,
    55.8533984, 46.88674647,
    30.8044592, 28.21181806
  )
)


oat_b1_ave_c <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 5*2),         # RT 5 timepoints × 2 replicates
    rep("8C", 5*2)          # 8C 5 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("4W","12W","24W","36W","51W"), each = 2), # RT
    rep(c("4W","12W","24W","36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    15.68640124, 11.69655556,
    # 8C 0
    16.45974441, 12.37666972,
    # RT 4W-51W
    5.596166796, 4.296071456,
    2.806401996, 1.545051691,
    0.522605688, 0.45974607,
    1.408994178, 1.396228178,
    0.975678907, 0.747706982,
    # 8C 4W-51W
    11.63554582, 8.615167968,
    9.113278377, 6.106442182,
    5.062998235, 3.314637657,
    2.502451824, 2.498070015,
    1.350273712, 1.268974113
  )
)



# -----------------------------
# Bilberry-Oat Drink Batch 1
# -----------------------------
biloat_b1_ave_a <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 5*2),         # RT 5 timepoints × 2 replicates
    rep("8C", 5*2)          # 8C 5 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("4W","12W","24W","36W","51W"), each = 2), # RT
    rep(c("4W","12W","24W","36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    6.388521214, 6.288400722,
    # 8C 0
    7.220062582, 7.27177057,
    # RT 4W-51W
    7.576714136, 7.737699462,
    6.406375319, 7.138106941,
    6.881407681, 5.869394815,
    5.774938913, 5.76228746,
    4.325606392, 4.135702285,
    # 8C 4W-51W
    4.225914785, 6.76,
    5.850398274, 6.726126938,
    2.768511225, 8.203119725,
    2.937147959, 5.363877056,
    2.70799041, 4.003942681
  )
)


biloat_b1_ave_b <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 5*2),         # RT 5 timepoints × 2 replicates
    rep("8C", 5*2)          # 8C 5 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("4W","12W","24W","36W","51W"), each = 2), # RT
    rep(c("4W","12W","24W","36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    23.21404214, 20.85383596,
    # 8C 0
    24.01469258, 21.16635776,
    # RT 4W-51W
    26.91960714, 22.30908129,
    20.35304022, 22.67396371,
    23.44579234, 19.84141794,
    21.18549499, 16.35664061,
    13.81056233, 10.48985437,
    # 8C 4W-51W
    16.58981891, 21.29877913,
    16.33296548, 22.47298148,
    9.214559474, 24.13211891,
    8.415870516, 19.37443042,
    9.978022152, 13.6115472
  )
)


biloat_b1_ave_c <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 5*2),         # RT 5 timepoints × 2 replicates
    rep("8C", 5*2)          # 8C 5 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("4W","12W","24W","36W","51W"), each = 2), # RT
    rep(c("4W","12W","24W","36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 5*2),  # 3 replicates for each
  Value = c(
    # RT 0
    5.956840712, 4.893437955,
    # 8C 0
    6.355726162, 5.79783887,
    # RT 4W-51W
    7.728949315, 6.158122165,
    6.32267347, 6.453724891,
    5.904295686, 4.715930548,
    5.379344996, 4.441167092,
    4.118133952, 2.525346257,
    # 8C 4W-51W
    4.736688222, 5.512902366,
    4.70357948, 5.733031281,
    2.049857067, 5.832943779,
    2.853314816, 5.317024194,
    2.605472115, 3.101455313
  )
)


#___________________________
#BATCH 2
#___________________________


# -----------------------------
# Oat Drink Batch 2
# -----------------------------
#4C?
oat_b2_ave_a <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 2*2),         # RT 2 timepoints × 2 replicates
    rep("8C", 2*2)          # 8C 2 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("36W","51W"), each = 2), # RT
    rep(c("36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 2*2),  # 2 replicates for each
  Value = c(
    # RT 0
    49.45223276, 48.33728702,
    # 8C 0
    49.45223276, 48.33728702,
    # RT 36W-51W
    23.89372044, 25.06740033,
    18.35691092, 16.65384018,
    # 8C 36W-51W
    32.86421003, 30.62932786,
    22.58169108, 18.67571864
  )
)

oat_b2_ave_b <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 2*2),         # RT 2 timepoints × 2 replicates
    rep("8C", 2*2)          # 8C 2 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("36W","51W"), each = 2), # RT
    rep(c("36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 2*2),  # 2 replicates for each
  Value = c(
    # RT 0
    109.0186902, 98.82346171,
    # 8C 0
    109.0186902, 98.82346171,
    # RT 36W-51W
    52.37249463, 51.30315348,
    40.49063316, 35.26147465,
    # 8C 36W-51W
    68.017714, 61.18219956,
    47.09017328, 46.02754025
  )
)


oat_b2_ave_c <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 2*2),         # RT 2 timepoints × 2 replicates
    rep("8C", 2*2)          # 8C 2 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("36W","51W"), each = 2), # RT
    rep(c("36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 2*2),  # 2 replicates for each
  Value = c(
    # RT 0
    55.74115307, 45.05311428,
    # 8C 0
    55.74115307, 45.05311428,
    # RT 36W-51W
    4.839861339, 4.112957429,
    1.432927687, 1.090920996,
    # 8C 36W-51W
    21.7249013, 16.39424108,
    11.01013281, 10.44325246
  )
)




# -----------------------------
# Bilberry-Oat Drink Batch 2
# -----------------------------
#4C?
biloat_b2_ave_a <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 2*2),         # RT 2 timepoints × 2 replicates
    rep("8C", 2*2)          # 8C 2 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("36W","51W"), each = 2), # RT
    rep(c("36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 2*2),  # 2 replicates for each
  Value = c(
    # RT 0
    22.25885892, 22.24969266,
    # 8C 0
    22.25885892, 22.24969266,
    # RT 36W-51W
    20.02174857, 18.92328304,
    15.57752859, 13.66723249,
    # 8C 36W-51W
    20.54490722, 19.64591905,
    18.39007555, 18.05911272
  )
)

biloat_b2_ave_b <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 2*2),         # RT 2 timepoints × 2 replicates
    rep("8C", 2*2)          # 8C 2 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("36W","51W"), each = 2), # RT
    rep(c("36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 2*2),  # 2 replicates for each
  Value = c(
    # RT 0
    45.13019708, 40.07612467,
    # 8C 0
    45.13019708, 40.07612467,
    # RT 36W-51W
    40.99210282, 38.90664789,
    32.03623702, 27.10879926,
    # 8C 36W-51W
    43.96098958, 41.58687977,
    39.30271425, 33.51140742
  )
)


biloat_b2_ave_c <- data.frame(
  Temperature = c(
    rep("RT", 2),           # RT 0
    rep("8C", 2),           # 8C 0
    rep("RT", 2*2),         # RT 2 timepoints × 2 replicates
    rep("8C", 2*2)          # 8C 2 timepoints × 2 replicates
  ),
  Time = c(
    rep("0", 2),  # RT 0
    rep("0", 2),  # 8C 0
    rep(c("36W","51W"), each = 2), # RT
    rep(c("36W","51W"), each = 2)  # 8C
  ),
  Replicate = rep(1:2, times = 2 + 2*2),  # 2 replicates for each
  Value = c(
    # RT 0
    31.6964043, 24.97988063,
    # 8C 0
    31.6964043, 24.97988063,
    # RT 36W-51W
    23.95525565, 20.1593541,
    15.80046938, 13.86809917,
    # 8C 36W-51W
    23.19450942, 20.87796362,
    23.12197031, 19.98949679
  )
)
