#Bilberry powder

#Temperature and Time set to catagorical factors
bilpow_acn$Temperature <- factor(bilpow_acn$Temperature, levels = c("O","RT","8C"))
bilpow_acn$Time <- factor(bilpow_acn$Time, levels = c("0","4W","3M","8M"))
