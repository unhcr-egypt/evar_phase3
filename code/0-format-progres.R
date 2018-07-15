library(readr)
##??recode
library(car)


ind <- read_csv("data/fromDB/Rpt_ActiveIndividuals.csv")
#names(ind)
#str(ind)
ind.pa <- ind[ ind$Relationship == "PA", ]

table(ind.pa$CurrentSize, useNA = "ifany")
prop.table(table(ind.pa$CurrentSize, useNA = "ifany"))

freq.CurrentSize <- cbind(as.data.frame(prop.table(table(ind.pa$CurrentSize, useNA = "ifany"))),
                  as.data.frame(table(ind.pa$CurrentSize, useNA = "ifany")))

ind.pa$Case.size <= ""
ind.pa$Case.size[ind.pa$CurrentSize == 0] <- "Case.size.1"
ind.pa$Case.size[ind.pa$CurrentSize == 1] <- "Case.size.1"
ind.pa$Case.size[ind.pa$CurrentSize == 2] <- "Case.size.2.to.4"
ind.pa$Case.size[ind.pa$CurrentSize == 3] <- "Case.size.2.to.4"
ind.pa$Case.size[ind.pa$CurrentSize == 4] <- "Case.size.2.to.4"
ind.pa$Case.size[ind.pa$CurrentSize == 5] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 6] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 7] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 8] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 9] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 10] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 11] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 12] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 13] <- "Case.size.5.and.more"
ind.pa$Case.size[ind.pa$CurrentSize == 14] <- "Case.size.5.and.more"

prop.table(table(ind.pa$Case.size, useNA = "ifany"))


table(ind.pa$Sex, useNA = "ifany")
prop.table(table(ind.pa$Sex, useNA = "ifany"))

## Checking on this first stratification   #####
ind.pa$strata1 <- paste(ind.pa$Sex,ind.pa$Case.size, sep = "-" )
prop.table(table(ind.pa$strata1, useNA = "ifany"))

freq.strata1  <- cbind(as.data.frame(prop.table(table(ind.pa$strata1 , useNA = "ifany"))),
                          as.data.frame(table(ind.pa$strata1 , useNA = "ifany")))



## now looking at nationality ########
table(ind.pa$NationalityCode, useNA = "ifany")
prop.table(table(ind.pa$NationalityCode, useNA = "ifany"))




## Syrian refugees
## Other nationalities (Arabic-speaking)
## Other nationalities (non-Arabic-speaking)
write.csv(levels(as.factor(ind.pa$NationalityCode)), "out/nationality.csv")
ind.pa$NationalityCat <- ""
ind.pa$NationalityCat[ind.pa$NationalityCode == "SYR"] <- "SYR"

ind.pa$NationalityCat[ind.pa$NationalityCode == "SOM"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "TUN"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "YEM"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "SUD"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "SAU"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "LBY"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "MAU"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "MOR"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "IRQ"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "JOR"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "DJB"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "CHD"] <- "ARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "ALG"] <- "ARAB"

ind.pa$NationalityCat[ind.pa$NationalityCode == "AFG"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "ANG"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "AZE"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "BDI"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "BEN"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "BGD"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "BKF"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "CAR"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "CHI"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "CMR"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "COB"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "COD"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "COI"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "ERT"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "ETH"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "GAM"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "GHA"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "GNB"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "GUI"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "ICO"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "IND"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "INS"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "KAZ"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "KEN"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "KOR"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "LBR"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "LKA"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "MLI"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "MYA"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "NGR"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "NIG"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "PAK"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "RUS"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "SLE"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "SSD"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "SUR"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "TAN"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "TJK"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "TKM"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "TOG"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "TUR"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "UGA"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "UZB"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "ZIM"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "ZZZ"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "U"] <- "NOARAB"
ind.pa$NationalityCat[ind.pa$NationalityCode == "-"] <- "NOARAB"


prop.table(table(ind.pa$NationalityCat, useNA = "ifany"))
## Checking on this first stratification   #####
ind.pa$strata2 <- paste(ind.pa$strata1, ind.pa$NationalityCat, sep = "-" )
#prop.table(table(ind.pa$strata2, useNA = "ifany"))

freq.strata2 <- cbind(as.data.frame(prop.table(table(ind.pa$strata2 , useNA = "ifany"))),
                       as.data.frame(table(ind.pa$strata2 , useNA = "ifany")))

levels(as.factor(ind.pa$strata2))
### mergin some strata --

ind.pa$strata3 <- as.character(ind.pa$strata2)

### No gender & Lnaguagedistinction on head of household for large case size...

ind.pa$strata3[ind.pa$strata2 == "M-Case.size.5.and.more-NOARAB"] <- "Case.size.5.and.more-NOSYR"
ind.pa$strata3[ind.pa$strata2 == "F-Case.size.5.and.more-NOARAB"] <- "Case.size.5.and.more-NOSYR"

ind.pa$strata3[ind.pa$strata2 == "M-Case.size.5.and.more-ARAB"] <- "Case.size.5.and.more-NOSYR"
ind.pa$strata3[ind.pa$strata2 == "F-Case.size.5.and.more-ARAB"] <- "Case.size.5.and.more-NOSYR"

ind.pa$strata3[ind.pa$strata2 == "M-Case.size.5.and.more-SYR"] <- "Case.size.5.and.more-SYR"
ind.pa$strata3[ind.pa$strata2 == "F-Case.size.5.and.more-SYR"] <- "Case.size.5.and.more-SYR"

### no gender distinction on head of household for large case size...

ind.pa$strata3[ind.pa$strata2 == "M-Case.size.2.to.4-NOARAB"] <- "M-Case.size.2.to.4-NOSYR"
ind.pa$strata3[ind.pa$strata2 == "F-Case.size.2.to.4-NOARAB"] <- "F-Case.size.2.to.4-NOSYR"

ind.pa$strata3[ind.pa$strata2 == "M-Case.size.2.to.4-ARAB"] <- "M-Case.size.2.to.4-NOSYR"
ind.pa$strata3[ind.pa$strata2 == "F-Case.size.2.to.4-ARAB"] <- "F-Case.size.2.to.4-NOSYR"

freq.strata3 <- cbind(as.data.frame(prop.table(table(ind.pa$strata3 , useNA = "ifany"))),
                      as.data.frame(table(ind.pa$strata3 , useNA = "ifany")))

### Save
write.csv(ind.pa,"data/indpa.csv", row.names = FALSE, na = "")

### Now including location....

## Compile Frequency table for Governorate
freq.gov <- cbind(as.data.frame(prop.table(table(ind.pa$Governorate, useNA = "ifany"))),
                  as.data.frame(table(ind.pa$Governorate, useNA = "ifany")))

freq <- as.data.frame(prop.table(table(ind.pa$Governorate)))
freq$coal1Cat <- as.character(freq$Var1)
freq$Governorate <- as.character(freq$Var1)
freq[freq$Freq <= 0.02, c("coal1Cat")] <- "Other"
freq[freq$Var1 == "", c("coal1Cat")] <- "Other"
freq <- freq[ ,c("Governorate","coal1Cat")]


ind.pa <- merge(x = ind.pa, y = freq, by = "Governorate", all.x = TRUE)

prop.table(table(ind.pa$coal1Cat, useNA = "ifany"))


table(ind.pa$CoA_L2, useNA = "ifany")
prop.table(table(ind.pa$CoA_L2, useNA = "ifany"))




## Compile Frequency table for district
freq.coa <- as.data.frame(prop.table(table(ind.pa$CoA_L2)))
freq.coa$coal2Cat <- as.character(freq.coa$Var1)
freq.coa$CoA_L2 <- as.character(freq.coa$Var1)
freq.coa[freq.coa$freq.coa <= 0.02, c("coal2Cat")] <- "Other"
freq.coa[freq.coa$Var1 == "", c("coal2Cat")] <- "Other"
freq.coa <- freq.coa[ ,c("CoA_L2","coal2Cat")]
ind.pa <- merge(x = ind.pa, y = freq.coa, by = "CoA_L2", all.x = TRUE)



ind.pa$COA <- paste(ind.pa$coal1Cat, ind.pa$coal2Cat, sep = "-")
freq <- cbind(as.data.frame(prop.table(table(ind.pa$COA, useNA = "ifany"))),
              as.data.frame(table(ind.pa$COA, useNA = "ifany")))
names(freq)[1] <- "COA"

district.all <- as.data.frame( unique(ind.pa[ ,c("COA", "coal1Cat", "coal1Cat","Governorate","CoA_L2")]))
freq <- merge( x = freq, y = district.all, by = "COA", all.y = TRUE)

ind.pa$COA.or <- ind.pa$COA

## Reworking the categories...
ind.pa$COA[ind.pa$COA == "Alexandria-NA"] <- "Alexandria-Other"
ind.pa$COA[ind.pa$COA == "Cairo-NA"] <- "Cairo-Other"

ind.pa$COA[ind.pa$COA == "Damietta-NA"] <- "Damietta-Other"
ind.pa$COA[ind.pa$COA == "Damietta-New Damietta"] <- "Damietta-Other"
ind.pa$COA[ind.pa$COA == "Damietta-Other"] <- "Damietta-all"

ind.pa$COA[ind.pa$COA == "Giza-NA"] <- "Giza-Other"

ind.pa$COA[ind.pa$COA == "Qalyubia-NA"] <- "Qalyubia-Other"
ind.pa$COA[ind.pa$COA == "Qalyubia-Al Obour"] <- "Qalyubia-Other"
ind.pa$COA[ind.pa$COA == "Qalyubia-Other"] <- "Qalyubia-all"

ind.pa$COA[ind.pa$COA == "Sharkia-NA"] <- "Sharkia-Other"
ind.pa$COA[ind.pa$COA == "Sharkia-Awlad Saqr"] <- "Sharkia-Other"
ind.pa$COA[ind.pa$COA == "Sharkia-Other"] <- "Sharkia-all"

ind.pa$COA[ind.pa$COA == "Other-NA"] <- "Other-Other"
ind.pa$COA[ind.pa$COA == "Other-Maadi"] <- "Other-Other"
ind.pa$COA[ind.pa$COA == "Other-6th October (1)"] <- "Other-Other"


## Checking the new size of strata
freq <- cbind(as.data.frame(prop.table(table(ind.pa$COA, useNA = "ifany"))),
              as.data.frame(table(ind.pa$COA, useNA = "ifany")))

## Now building the strata

ind.pa$strata1 <- paste( ind.pa$COA, ind.pa$NationalityCat)
freq.strata1 <- cbind(as.data.frame(prop.table(table(ind.pa$strata1, useNA = "ifany"))),
                     as.data.frame(table(ind.pa$strata1, useNA = "ifany")))

ind.pa$strata2 <- paste( ind.pa$COA, ind.pa$Sex )
freq.strata2 <- cbind(as.data.frame(prop.table(table(ind.pa$strata2, useNA = "ifany"))),
                      as.data.frame(table(ind.pa$strata2, useNA = "ifany")))

ind.pa$strata3 <- paste( ind.pa$COA,  ind.pa$Case.size)
freq.strata3 <- cbind(as.data.frame(prop.table(table(ind.pa$strata3, useNA = "ifany"))),
                      as.data.frame(table(ind.pa$strata3, useNA = "ifany")))

ind.pa$strata4 <- paste( ind.pa$COA, ind.pa$NationalityCat, ind.pa$Sex )
freq.strata4 <- cbind(as.data.frame(prop.table(table(ind.pa$strata4, useNA = "ifany"))),
                      as.data.frame(table(ind.pa$strata4, useNA = "ifany")))

ind.pa$strata5 <- paste( ind.pa$COA, ind.pa$NationalityCat,  ind.pa$Case.size)
freq.strata5 <- cbind(as.data.frame(prop.table(table(ind.pa$strata5, useNA = "ifany"))),
                      as.data.frame(table(ind.pa$strata5, useNA = "ifany")))

ind.pa$strata6 <- paste( ind.pa$COA, ind.pa$NationalityCat, ind.pa$Sex , ind.pa$Case.size)
freq.strata6 <- cbind(as.data.frame(prop.table(table(ind.pa$strata6, useNA = "ifany"))),
                      as.data.frame(table(ind.pa$strata6, useNA = "ifany")))

ind.pa$strata7 <- paste( ind.pa$NationalityCat, ind.pa$Sex , ind.pa$Case.size)
freq.strata7 <- cbind(as.data.frame(prop.table(table(ind.pa$strata7, useNA = "ifany"))),
                      as.data.frame(table(ind.pa$strata7, useNA = "ifany")))
