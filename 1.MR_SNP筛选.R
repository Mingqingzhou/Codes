library(TwoSampleMR)
rm(list=ls())
setwd("F:/desktop/R/MR code/all")
loneliness<-read.csv("F:/desktop/R/MR code/Loneliness_ukb_8476.csv")
names(loneliness)
head(loneliness)
loneliness_sub <- subset(loneliness,pval.exposure<5e-6)
names(loneliness_sub)
write.csv(loneliness_sub,file = "loneliness_sub_ukb_8476_e6.csv")

package_location <- find.package("TwoSampleMR")
print(package_location)


loneliness_file <- system.file("MR/loneliness_sub_ukb_8476_e6.csv", package="TwoSampleMR") ##PUT the loneliness beta file into the root file of R twosample MR


loneliness_exp_dat <- read_exposure_data(
    filename = loneliness_file,
    sep = ",",
    snp_col = "SNP",
    beta_col = "beta.exposure",
    se_col = "se.exposure",
    effect_allele_col = "effect_allele.exposure",
    other_allele_col = "other_allele.exposure",
    pval_col = "pval.exposure",
    eaf_col ="eaf.exposure")

loneliness_exp_dat<- clump_data(loneliness_exp_dat,clump_kb = 10000,
                                clump_r2 = 0.01,
                                clump_p1 = 1,
                                clump_p2 = 1,
                                pop = "EUR")

names(loneliness_exp_dat)
head(loneliness_exp_dat)
write.csv(loneliness_exp_dat,"loneliness_need_ukb_8476_e06_0.01.csv",row.names = FALSE)

