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
