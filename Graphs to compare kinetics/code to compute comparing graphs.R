install.packages("patchwork")
library(patchwork)

#----------------------------------------------
#ANTHOCYANINS
#----------------------------------------------

#BILBERRY DRINK ANTHOCYANINS
pdf("bil_acn_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
bil_acn_pdf <-
  results$bil_acn$plot_C +
  results$bil_b1_acn$plot_C +
  results$bil_b2_acn$plot_C +
  plot_layout(ncol = 2)

print(bil_acn_pdf)  # first page

# --- Page 2: Kinetics ---
bil_acn_k_pdf <-
  results$bil_acn$plot_lnC +
  results$bil_b1_acn$plot_lnC +
  results$bil_b2_acn$plot_lnC +
  plot_layout(ncol = 2)

print(bil_acn_k_pdf)  # second page

dev.off()

browseURL("bil_acn_compare.pdf")


#BILBERRY POWDER ANTHOCYANINS
pdf("bilpow_acn_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
bilpow_acn_pdf <-
  results$bilpow_acn$plot_C +
  results$bilpow_b1_acn$plot_C +
  results$bilpow_b2_acn$plot_C +
  plot_layout(ncol = 2)

print(bilpow_acn_pdf)  # first page

# --- Page 2: Kinetics ---
bilpow_acn_k_pdf <-
  results$bilpow_acn$plot_lnC +
  results$bilpow_b1_acn$plot_lnC +
  results$bilpow_b2_acn$plot_lnC +
  plot_layout(ncol = 2)

print(bilpow_acn_k_pdf)  # second page

dev.off()

browseURL("bilpow_acn_compare.pdf")


#BILBERRY-OAT DRINK ANTHOCYANINS
pdf("biloat_acn_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
biloat_acn_pdf <-
  results$biloat_acn$plot_C +
  results$biloat_b1_acn$plot_C +
  results$biloat_b2_acn$plot_C +
  plot_layout(ncol = 2)

print(biloat_acn_pdf)  # first page

# --- Page 2: Kinetics ---
biloat_acn_k_pdf <-
  results$biloat_acn$plot_lnC +
  results$biloat_b1_acn$plot_lnC +
  results$biloat_b2_acn$plot_lnC +
  plot_layout(ncol = 2)

print(biloat_acn_k_pdf)  # second page

dev.off()

browseURL("biloat_acn_compare.pdf")


#OAT DRINK ANTHOCYANINS
pdf("oat_acn_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
oat_acn_pdf <-
  results$oat_acn$plot_C +
  results$oat_b1_acn$plot_C +
  results$oat_b2_acn$plot_C +
  plot_layout(ncol = 2)

print(oat_acn_pdf)  # first page

# --- Page 2: Kinetics ---
oat_acn_k_pdf <-
  results$oat_acn$plot_lnC +
  results$oat_b1_acn$plot_lnC +
  results$oat_b2_acn$plot_lnC +
  plot_layout(ncol = 2)

print(oat_acn_k_pdf)  # second page

dev.off()

browseURL("oat_acn_compare.pdf")



#----------------------------------------------
#TOTAL POLYPHENOLS
#----------------------------------------------


#BILBERRY DRINK TOTAL POLYPHENOLS
pdf("bil_tp_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
bil_tp_pdf <-
  results$bil_tp$plot_C +
  results$bil_b1_tp$plot_C +
  results$bil_b2_tp$plot_C +
  plot_layout(ncol = 2)

print(bil_tp_pdf)  # first page

# --- Page 2: Kinetics ---
bil_tp_k_pdf <-
  results$bil_tp$plot_lnC +
  results$bil_b1_tp$plot_lnC +
  results$bil_b2_tp$plot_lnC +
  plot_layout(ncol = 2)

print(bil_tp_k_pdf)  # second page

dev.off()

browseURL("bil_tp_compare.pdf")



#OAT DRINK TOTAL POLYPHENOLS
pdf("oat_tp_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
oat_tp_pdf <-
  results$oat_tp$plot_C +
  results$oat_b1_tp$plot_C +
  results$oat_b2_tp$plot_C +
  plot_layout(ncol = 2)

print(oat_tp_pdf)  # first page

# --- Page 2: Kinetics ---
oat_tp_k_pdf <-
  results$oat_tp$plot_lnC +
  results$oat_b1_tp$plot_lnC +
  results$oat_b2_tp$plot_lnC +
  plot_layout(ncol = 2)

print(oat_tp_k_pdf)  # second page

dev.off()

browseURL("oat_tp_compare.pdf")



#BIL-OAT DRINK TOTAL POLYPHENOLS
pdf("biloat_tp_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
biloat_tp_pdf <-
  results$biloat_tp$plot_C +
  results$biloat_b1_tp$plot_C +
  results$biloat_b2_tp$plot_C +
  plot_layout(ncol = 2)

print(biloat_tp_pdf)  # first page

# --- Page 2: Kinetics ---
biloat_tp_k_pdf <-
  results$biloat_tp$plot_lnC +
  results$biloat_b1_tp$plot_lnC +
  results$biloat_b2_tp$plot_lnC +
  plot_layout(ncol = 2)

print(biloat_tp_k_pdf)  # second page

dev.off()

browseURL("biloat_tp_compare.pdf")



#BILBERRY POWDER DRINK TOTAL POLYPHENOLS
pdf("bilpow_tp_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
bilpow_tp_pdf <-
  results$bilpow_tp$plot_C +
  results$bilpow_b1_tp$plot_C +
  results$bilpow_b2_tp$plot_C +
  plot_layout(ncol = 2)

print(bilpow_tp_pdf)  # first page

# --- Page 2: Kinetics ---
bilpow_tp_k_pdf <-
  results$bilpow_tp$plot_lnC +
  results$bilpow_b1_tp$plot_lnC +
  results$bilpow_b2_tp$plot_lnC +
  plot_layout(ncol = 2)

print(bilpow_tp_k_pdf)  # second page

dev.off()

browseURL("bilpow_tp_compare.pdf")



#----------------------------------------------
#AVANTHRAMIDES
#----------------------------------------------

#BILOAT DRINK AVENTHRAMIDES
pdf("biloat_ave_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
biloat_ave_pdf <-
  results$biloat_ave_total$plot_C +
  results$biloat_b1_ave_total$plot_C +
  results$biloat_b2_ave_total$plot_C +
  plot_layout(ncol = 2)

print(biloat_ave_pdf)  # first page

# --- Page 2: Kinetics ---
biloat_ave_k_pdf <-
  results$biloat_ave_total$plot_lnC +
  results$biloat_b1_ave_total$plot_lnC +
  results$biloat_b2_ave_total$plot_lnC +
  plot_layout(ncol = 2)

print(biloat_ave_k_pdf)  # second page

dev.off()

browseURL("biloat_ave_compare.pdf")



#OAT DRINK AVENTHRAMIDES
pdf("oat_ave_compare.pdf", width = 10, height = 8)  # single PDF file

# --- Page 1: Concentration vs Time ---
oat_ave_pdf <-
  results$oat_ave_total$plot_C +
  results$oat_b1_ave_total$plot_C +
  results$oat_b2_ave_total$plot_C +
  plot_layout(ncol = 2)

print(oat_ave_pdf)  # first page

# --- Page 2: Kinetics ---
oat_ave_k_pdf <-
  results$oat_ave_total$plot_lnC +
  results$oat_b1_ave_total$plot_lnC +
  results$oat_b2_ave_total$plot_lnC +
  plot_layout(ncol = 2)

print(oat_ave_k_pdf)  # second page

dev.off()

browseURL("oat_ave_compare.pdf")
