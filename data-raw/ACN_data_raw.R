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
