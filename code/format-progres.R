library(readr)
ind <- read_csv("data/fromDB/Rpt_ActiveIndividuals.csv")
names(ind)
str(ind)

ind.pa <- ind[ ind$Relationship == "PA", ]

table(ind.pa$CurrentSize, useNA = "ifany")
prop.table(table(ind.pa$CurrentSize, useNA = "ifany"))

??recode
library(car)
ind.pa$Case.size <- recode(ind.pa$CurrentSize,"'0'='Case.size.1';
                                 '1'='Case.size.1';
                                 '2'='Case.size.2';
                                 '3'='Case.size.3.to.5';
                                 '4'='Case.size.3.to.5';
                                 '5'='Case.size.3.to.5';
                                 '6'='Case.size.6.and.more';
                                 '7'='Case.size.6.and.more';
                                 '8'='Case.size.6.and.more';
                                 '9'='Case.size.6.and.more';
                                 '10'='Case.size.6.and.more';
                                 '11'='Case.size.6.and.more';
                                 '12'='Case.size.6.and.more';
                                 '13'='Case.size.6.and.more';
                                 '14'='Case.size.6.and.more'")

prop.table(table(ind.pa$Case.size, useNA = "ifany"))


table(ind.pa$Sex, useNA = "ifany")
prop.table(table(ind.pa$Sex, useNA = "ifany"))

table(ind.pa$NationalityCode, useNA = "ifany")
prop.table(table(ind.pa$NationalityCode, useNA = "ifany"))

## Syrian refugees
## Other nationalities (Arabic-speaking)
## Other nationalities (non-Arabic-speaking)
write.csv(levels(as.factor(ind.pa$NationalityCode)), "out/nationality.csv")
ind.pa$NationalityCat <- recode(ind.pa$NationalityCode,"'AFG'='NOARAB';
                                'ALG'='ARAB';
                                'ANG'='NOARAB';
                                'AZE'='NOARAB';
                                'BDI'='NOARAB';
                                'BEN'='NOARAB';
                                'BGD'='NOARAB';
                                'BKF'='NOARAB';
                                'CAR'='NOARAB';
                                'CHD'='ARAB';
                                'CHI'='NOARAB';
                                'CMR'='NOARAB';
                                'COB'='NOARAB';
                                'COD'='NOARAB';
                                'COI'='NOARAB';
                                'DJB'='ARAB';
                                'ERT'='NOARAB';
                                'ETH'='NOARAB';
                                'GAM'='NOARAB';
                                'GHA'='NOARAB';
                                'GNB'='NOARAB';
                                'GUI'='NOARAB';
                                'ICO'='NOARAB';
                                'IND'='NOARAB';
                                'INS'='NOARAB';
                                'IRQ'='ARAB';
                                'JOR'='ARAB';
                                'KAZ'='NOARAB';
                                'KEN'='NOARAB';
                                'KOR'='NOARAB';
                                'LBR'='NOARAB';
                                'LBY'='ARAB';
                                'LKA'='NOARAB';
                                'MAU'='ARAB';
                                'MLI'='NOARAB';
                                'MOR'='ARAB';
                                'MYA'='NOARAB';
                                'NGR'='NOARAB';
                                'NIG'='NOARAB';
                                'PAK'='NOARAB';
                                'RUS'='NOARAB';
                                'SAU'='ARAB';
                                'SLE'='NOARAB';
                                'SOM'='ARAB';
                                'SSD'='NOARAB';
                                'SUD'='ARAB';
                                'SUR'='NOARAB';
                                'SYR'='SYR';
                                'TAN'='NOARAB';
                                'TJK'='NOARAB';
                                'TKM'='NOARAB';
                                'TOG'='NOARAB';
                                'TUN'='ARAB';
                                'TUR'='NOARAB';
                                'U'='NOARAB';
                                'UGA'='NOARAB';
                                'UZB'='NOARAB';
                                'YEM'='ARAB';
                                'ZIM'='NOARAB';
                                'ZZZ'='NOARAB';
                                '-'='NOARAB'")


prop.table(table(ind.pa$NationalityCat, useNA = "ifany"))

table(ind.pa$CoA_L2, useNA = "ifany")
prop.table(table(ind.pa$CoA_L2, useNA = "ifany"))

freq <- as.data.frame(prop.table(table(ind.pa$CoA_L2)))
freq$coal2Cat <- as.character(freq$Var1)
freq$CoA_L2 <- as.character(freq$Var1)
freq[freq$Freq <= 0.02, c("coal2Cat")] <- "Other"
freq[freq$Var1 == "", c("coal2Cat")] <- "Other"
freq <- freq[ ,c("CoA_L2","coal2Cat")]


ind.pa <- merge(x = ind.pa, y = freq, by = "CoA_L2", all.x = TRUE)

prop.table(table(ind.pa$coal2Cat, useNA = "ifany"))

