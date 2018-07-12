rm(list = ls())

## Load all required packages         #############################################
source("code/0-packages.R")
source("code/0-config.R")

### Double Check that you have the last version
#source("https://raw.githubusercontent.com/Edouard-Legoupil/koboloadeR/master/inst/script/install_github.R")
#install.packages("devtools")
#library("devtools")
#install_github("unhcr/koboloadeR")

library(koboloadeR)

## kobo_projectinit()
## Now Position your form & your data in the data folder



## Load form and building dictionnary #############################################
#rm(form)
#form <- "form.xls"
## Generate & Load dictionnary
cat("\n\n\n Generate dictionnary from the xlsform \n\n\n\n")
kobo_dico(form)
dico <- read.csv(paste("data/dico_",form,".csv",sep = ""), encoding = "UTF-8", na.strings = "")
#rm(form)


#### now loading all files

write.csv( list.files("data", pattern = NULL, all.files = FALSE, full.names = FALSE), "data/listfile.csv", row.names = FALSE)
library(readr)

### Loading data from CSV extract ######

household <- read_csv("data/evarv3_core.csv")
household_household_member <- read_csv("data/evarv3_household_household_member.csv")
child_fo22_sources_child_food_consumed <- read_csv("data/evarv3_child_fo22_sources_child_food_consumed.csv")
enmrtor_obsrvtons_referrals_to <- read_csv("data/evarv3_enmrtor_obsrvtons_referrals_to.csv")
fodcnsptnndfdsrces_food_consumption <- read_csv("data/evarv3_fodcnsptnndfdsrces_food_consumption.csv")
hoshld_membr_dtils_specific_needs_progres <- read_csv("data/evarv3_hoshld_membr_dtils_specific_needs_progres.csv")
hoshldmmbermrdtils_how_did_u_raise_money <- read_csv("data/evarv3_hoshldmmbermrdtils_how_did_u_raise_money.csv")
hoshldmmbermrdtils_how_start_work <- read_csv("data/evarv3_hoshldmmbermrdtils_how_start_work.csv")
hoshldmmbermrdtils_not_employeed_reasons <- read_csv("data/evarv3_hoshldmmbermrdtils_not_employeed_reasons.csv")
hoshldmmbermrdtils_occupation_pro_gres_coa <- read_csv("data/evarv3_hoshldmmbermrdtils_occupation_pro_gres_coa.csv")
hoshldmmbermrdtils_occupation_pro_gres_coo <- read_csv("data/evarv3_hoshldmmbermrdtils_occupation_pro_gres_coo.csv")
hoshldmmbermrdtils_skill <- read_csv("data/evarv3_hoshldmmbermrdtils_skill.csv")
hoshldmmbermrdtils_support_needed <- read_csv("data/evarv3_hoshldmmbermrdtils_support_needed.csv")
hoshldmmbermrdtils_type_of_business <- read_csv("data/evarv3_hoshldmmbermrdtils_type_of_business.csv")
hshld_cpng_strtgy_immigration <- read_csv("data/evarv3_hshld_cpng_strtgy_immigration.csv")
hshld_cpng_strtgy_strategies_for_long_term <- read_csv("data/evarv3_hshld_cpng_strtgy_strategies_for_long_term.csv")
hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food <- read_csv("data/evarv3_hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food.csv")
hshld_cpng_strtgy_strategies_to_meet_basic_needs <- read_csv("data/evarv3_hshld_cpng_strtgy_strategies_to_meet_basic_needs.csv")
main_hou27_details_work_kind_child <- read_csv("data/evarv3_main_hou27_details_work_kind_child.csv")
main_hou42_reasons_not_attending_school_reason_1 <- read_csv("data/evarv3_main_hou42_reasons_not_attending_school_reason_1.csv")
main_inc33st_month_bill_verfication <- read_csv("data/evarv3_main_inc33st_month_bill_verfication.csv")
main_inc33st_month_expenditures <- read_csv("data/evarv3_main_inc33st_month_expenditures.csv")
main_inc36y_source_source_of_income_assistance_1 <- read_csv("data/evarv3_main_inc36y_source_source_of_income_assistance_1.csv")
main_inc36y_source_source_of_income_external_4 <- read_csv("data/evarv3_main_inc36y_source_source_of_income_external_4.csv")
main_inc36y_source_source_of_income_neg_coping_3 <- read_csv("data/evarv3_main_inc36y_source_source_of_income_neg_coping_3.csv")
main_inc46_details_dept_source <- read_csv("data/evarv3_main_inc46_details_dept_source.csv")
main_inc46_details_how_repay_dept <- read_csv("data/evarv3_main_inc46_details_how_repay_dept.csv")
main_inc46_details_source_of_income <- read_csv("data/evarv3_main_inc46_details_source_of_income.csv")
main_inc46_details_unexpected_expenses_reason <- read_csv("data/evarv3_main_inc46_details_unexpected_expenses_reason.csv")
not_satisfied_work <- read_csv("data/evarv3_not_satisfied_work.csv")
not_seeking_work <- read_csv("data/evarv3_not_seeking_work.csv")
reasons_of_borrow <- read_csv("data/evarv3_reasons_of_borrow.csv")
source_of_income_work_2 <- read_csv("data/evarv3_source_of_income_work_2.csv")

## Getting labels ######
labhousehold <- as.data.frame(names(household))
labchild_fo22_sources_child_food_consumed <- as.data.frame(names(child_fo22_sources_child_food_consumed))
labenmrtor_obsrvtons_referrals_to <- as.data.frame(names(enmrtor_obsrvtons_referrals_to))
labfodcnsptnndfdsrces_food_consumption <- as.data.frame(names(fodcnsptnndfdsrces_food_consumption))
labhoshld_membr_dtils_specific_needs_progres <- as.data.frame(names(hoshld_membr_dtils_specific_needs_progres))
labhoshldmmbermrdtils_how_did_u_raise_money <- as.data.frame(names(hoshldmmbermrdtils_how_did_u_raise_money))
labhoshldmmbermrdtils_how_start_work <- as.data.frame(names(hoshldmmbermrdtils_how_start_work))
labhoshldmmbermrdtils_not_employeed_reasons <- as.data.frame(names(hoshldmmbermrdtils_not_employeed_reasons))
labhoshldmmbermrdtils_occupation_pro_gres_coa <- as.data.frame(names(hoshldmmbermrdtils_occupation_pro_gres_coa))
labhoshldmmbermrdtils_occupation_pro_gres_coo <- as.data.frame(names(hoshldmmbermrdtils_occupation_pro_gres_coo))
labhoshldmmbermrdtils_skill <- as.data.frame(names(hoshldmmbermrdtils_skill))
labhoshldmmbermrdtils_support_needed <- as.data.frame(names(hoshldmmbermrdtils_support_needed))
labhoshldmmbermrdtils_type_of_business <- as.data.frame(names(hoshldmmbermrdtils_type_of_business))
labhousehold_household_member <- as.data.frame(names(household_household_member))
labhshld_cpng_strtgy_immigration <- as.data.frame(names(hshld_cpng_strtgy_immigration))
labhshld_cpng_strtgy_strategies_for_long_term <- as.data.frame(names(hshld_cpng_strtgy_strategies_for_long_term))
labhshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food <- as.data.frame(names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food))
labhshld_cpng_strtgy_strategies_to_meet_basic_needs <- as.data.frame(names(hshld_cpng_strtgy_strategies_to_meet_basic_needs))
labmain_hou27_details_work_kind_child <- as.data.frame(names(main_hou27_details_work_kind_child))
labmain_hou42_reasons_not_attending_school_reason_1 <- as.data.frame(names(main_hou42_reasons_not_attending_school_reason_1))
labmain_inc33st_month_bill_verfication <- as.data.frame(names(main_inc33st_month_bill_verfication))
labmain_inc33st_month_expenditures <- as.data.frame(names(main_inc33st_month_expenditures))
labmain_inc36y_source_source_of_income_assistance_1 <- as.data.frame(names(main_inc36y_source_source_of_income_assistance_1))
labmain_inc36y_source_source_of_income_external_4 <- as.data.frame(names(main_inc36y_source_source_of_income_external_4))
labmain_inc36y_source_source_of_income_neg_coping_3 <- as.data.frame(names(main_inc36y_source_source_of_income_neg_coping_3))
labmain_inc46_details_dept_source <- as.data.frame(names(main_inc46_details_dept_source))
labmain_inc46_details_how_repay_dept <- as.data.frame(names(main_inc46_details_how_repay_dept))
labmain_inc46_details_source_of_income <- as.data.frame(names(main_inc46_details_source_of_income))
labmain_inc46_details_unexpected_expenses_reason <- as.data.frame(names(main_inc46_details_unexpected_expenses_reason))
labnot_satisfied_work <- as.data.frame(names(not_satisfied_work))
labnot_seeking_work <- as.data.frame(names(not_seeking_work))
labreasons_of_borrow <- as.data.frame(names(reasons_of_borrow))
labsource_of_income_work_2 <- as.data.frame(names(source_of_income_work_2))


## Renaming labelframe ###
names(labhousehold)[1] <- "labvar"
names(labchild_fo22_sources_child_food_consumed)[1] <- "labvar"
names(labenmrtor_obsrvtons_referrals_to)[1] <- "labvar"
names(labfodcnsptnndfdsrces_food_consumption)[1] <- "labvar"
names(labhoshld_membr_dtils_specific_needs_progres)[1] <- "labvar"
names(labhoshldmmbermrdtils_how_did_u_raise_money)[1] <- "labvar"
names(labhoshldmmbermrdtils_how_start_work)[1] <- "labvar"
names(labhoshldmmbermrdtils_not_employeed_reasons)[1] <- "labvar"
names(labhoshldmmbermrdtils_occupation_pro_gres_coa)[1] <- "labvar"
names(labhoshldmmbermrdtils_occupation_pro_gres_coo)[1] <- "labvar"
names(labhoshldmmbermrdtils_skill)[1] <- "labvar"
names(labhoshldmmbermrdtils_support_needed)[1] <- "labvar"
names(labhoshldmmbermrdtils_type_of_business)[1] <- "labvar"
names(labhousehold_household_member)[1] <- "labvar"
names(labhshld_cpng_strtgy_immigration)[1] <- "labvar"
names(labhshld_cpng_strtgy_strategies_for_long_term)[1] <- "labvar"
names(labhshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[1] <- "labvar"
names(labhshld_cpng_strtgy_strategies_to_meet_basic_needs)[1] <- "labvar"
names(labmain_hou27_details_work_kind_child)[1] <- "labvar"
names(labmain_hou42_reasons_not_attending_school_reason_1)[1] <- "labvar"
names(labmain_inc33st_month_bill_verfication)[1] <- "labvar"
names(labmain_inc33st_month_expenditures)[1] <- "labvar"
names(labmain_inc36y_source_source_of_income_assistance_1)[1] <- "labvar"
names(labmain_inc36y_source_source_of_income_external_4)[1] <- "labvar"
names(labmain_inc36y_source_source_of_income_neg_coping_3)[1] <- "labvar"
names(labmain_inc46_details_dept_source)[1] <- "labvar"
names(labmain_inc46_details_how_repay_dept)[1] <- "labvar"
names(labmain_inc46_details_source_of_income)[1] <- "labvar"
names(labmain_inc46_details_unexpected_expenses_reason)[1] <- "labvar"
names(labnot_satisfied_work)[1] <- "labvar"
names(labnot_seeking_work)[1] <- "labvar"
names(labreasons_of_borrow)[1] <- "labvar"
names(labsource_of_income_work_2)[1] <- "labvar"


## Adding related frame name ###
labhousehold$frame <- "household"
labchild_fo22_sources_child_food_consumed$frame <- "child_fo22_sources_child_food_consumed"
labenmrtor_obsrvtons_referrals_to$frame <- "enmrtor_obsrvtons_referrals_to"
labfodcnsptnndfdsrces_food_consumption$frame <- "fodcnsptnndfdsrces_food_consumption"
labhoshld_membr_dtils_specific_needs_progres$frame <- "hoshld_membr_dtils_specific_needs_progres"
labhoshldmmbermrdtils_how_did_u_raise_money$frame <- "hoshldmmbermrdtils_how_did_u_raise_money"
labhoshldmmbermrdtils_how_start_work$frame <- "hoshldmmbermrdtils_how_start_work"
labhoshldmmbermrdtils_not_employeed_reasons$frame <- "hoshldmmbermrdtils_not_employeed_reasons"
labhoshldmmbermrdtils_occupation_pro_gres_coa$frame <- "hoshldmmbermrdtils_occupation_pro_gres_coa"
labhoshldmmbermrdtils_occupation_pro_gres_coo$frame <- "hoshldmmbermrdtils_occupation_pro_gres_coo"
labhoshldmmbermrdtils_skill$frame <- "hoshldmmbermrdtils_skill"
labhoshldmmbermrdtils_support_needed$frame <- "hoshldmmbermrdtils_support_needed"
labhoshldmmbermrdtils_type_of_business$frame <- "hoshldmmbermrdtils_type_of_business"
labhousehold_household_member$frame <- "household_household_member"
labhshld_cpng_strtgy_immigration$frame <- "hshld_cpng_strtgy_immigration"
labhshld_cpng_strtgy_strategies_for_long_term$frame <- "hshld_cpng_strtgy_strategies_for_long_term"
labhshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food$frame <- "hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food"
labhshld_cpng_strtgy_strategies_to_meet_basic_needs$frame <- "hshld_cpng_strtgy_strategies_to_meet_basic_needs"
labmain_hou27_details_work_kind_child$frame <- "main_hou27_details_work_kind_child"
labmain_hou42_reasons_not_attending_school_reason_1$frame <- "main_hou42_reasons_not_attending_school_reason_1"
labmain_inc33st_month_bill_verfication$frame <- "main_inc33st_month_bill_verfication"
labmain_inc33st_month_expenditures$frame <- "main_inc33st_month_expenditures"
labmain_inc36y_source_source_of_income_assistance_1$frame <- "main_inc36y_source_source_of_income_assistance_1"
labmain_inc36y_source_source_of_income_external_4$frame <- "main_inc36y_source_source_of_income_external_4"
labmain_inc36y_source_source_of_income_neg_coping_3$frame <- "main_inc36y_source_source_of_income_neg_coping_3"
labmain_inc46_details_dept_source$frame <- "main_inc46_details_dept_source"
labmain_inc46_details_how_repay_dept$frame <- "main_inc46_details_how_repay_dept"
labmain_inc46_details_source_of_income$frame <- "main_inc46_details_source_of_income"
labmain_inc46_details_unexpected_expenses_reason$frame <- "main_inc46_details_unexpected_expenses_reason"
labnot_satisfied_work$frame <- "not_satisfied_work"
labnot_seeking_work$frame <- "not_seeking_work"
labreasons_of_borrow$frame <- "reasons_of_borrow"
labsource_of_income_work_2$frame <- "source_of_income_work_2"


## Binding labelname
label <- rbind(labhousehold,
               labchild_fo22_sources_child_food_consumed,
               labenmrtor_obsrvtons_referrals_to,
               labfodcnsptnndfdsrces_food_consumption,
               labhoshld_membr_dtils_specific_needs_progres,
               labhoshldmmbermrdtils_how_did_u_raise_money,
               labhoshldmmbermrdtils_how_start_work,
               labhoshldmmbermrdtils_not_employeed_reasons,
               labhoshldmmbermrdtils_occupation_pro_gres_coa,
               labhoshldmmbermrdtils_occupation_pro_gres_coo,
               labhoshldmmbermrdtils_skill,
               labhoshldmmbermrdtils_support_needed,
               labhoshldmmbermrdtils_type_of_business,
               labhousehold_household_member,
               labhshld_cpng_strtgy_immigration,
               labhshld_cpng_strtgy_strategies_for_long_term,
               labhshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food,
               labhshld_cpng_strtgy_strategies_to_meet_basic_needs,
               labmain_hou27_details_work_kind_child,
               labmain_hou42_reasons_not_attending_school_reason_1,
               labmain_inc33st_month_bill_verfication,
               labmain_inc33st_month_expenditures,
               labmain_inc36y_source_source_of_income_assistance_1,
               labmain_inc36y_source_source_of_income_external_4,
               labmain_inc36y_source_source_of_income_neg_coping_3,
               labmain_inc46_details_dept_source,
               labmain_inc46_details_how_repay_dept,
               labmain_inc46_details_source_of_income,
               labmain_inc46_details_unexpected_expenses_reason,
               labnot_satisfied_work,
               labnot_seeking_work,
               labreasons_of_borrow,
               labsource_of_income_work_2)

## Remonging all label
rm(labhousehold,
   labchild_fo22_sources_child_food_consumed,
   labenmrtor_obsrvtons_referrals_to,
   labfodcnsptnndfdsrces_food_consumption,
   labhoshld_membr_dtils_specific_needs_progres,
   labhoshldmmbermrdtils_how_did_u_raise_money,
   labhoshldmmbermrdtils_how_start_work,
   labhoshldmmbermrdtils_not_employeed_reasons,
   labhoshldmmbermrdtils_occupation_pro_gres_coa,
   labhoshldmmbermrdtils_occupation_pro_gres_coo,
   labhoshldmmbermrdtils_skill,
   labhoshldmmbermrdtils_support_needed,
   labhoshldmmbermrdtils_type_of_business,
   labhousehold_household_member,
   labhshld_cpng_strtgy_immigration,
   labhshld_cpng_strtgy_strategies_for_long_term,
   labhshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food,
   labhshld_cpng_strtgy_strategies_to_meet_basic_needs,
   labmain_hou27_details_work_kind_child,
   labmain_hou42_reasons_not_attending_school_reason_1,
   labmain_inc33st_month_bill_verfication,
   labmain_inc33st_month_expenditures,
   labmain_inc36y_source_source_of_income_assistance_1,
   labmain_inc36y_source_source_of_income_external_4,
   labmain_inc36y_source_source_of_income_neg_coping_3,
   labmain_inc46_details_dept_source,
   labmain_inc46_details_how_repay_dept,
   labmain_inc46_details_source_of_income,
   labmain_inc46_details_unexpected_expenses_reason,
   labnot_satisfied_work,
   labnot_seeking_work,
   labreasons_of_borrow,
   labsource_of_income_work_2)



## working on label name - converting to small cap
names(label)
label$labvar2 <- tolower(label$labvar)
write.csv(label,"data/datalabel.csv", row.names = FALSE)
#write.csv(label,"data/datalabel.csv")


#View(household_household_member[ ,c("HOUSEHOLD_MEMBER_MORE_DETAILS_CASE_NUMBER")])
#View(household_household_member[ ,c("HOUSEHOLD_MEMBER_DETAILS_CASE_NUMBER_DEFAULT")])
#View(household[ ,c("GENERAL_INFORMATION_GEOPOINT_LOCATION_LAT", "GENERAL_INFORMATION_GEOPOINT_LOCATION_LNG")])
#View(household[ ,c("HOSHLD_COPNG_STRTGY_STRATEGIES_FOR_LONG_TERM_DESC", "HOSHLD_COPNG_STRTGY_STRATEGIES_TO_COPE_WITH_A_LACK_OF_FOOD_DESC",
#"HOSHLD_COPNG_STRTGY_STRATEGIES_TO_MEET_BASIC_NEEDS_DESC", "HOUSEHOLD_HOUSEHOLD_DESC", "HOUSEHOLD_HOUSEHOLD_MEMBER_COUNT")])

library(readxl)
##mapping <- read_excel("data/mapping.xlsx")

## 2 cases to handle
#### simple renaming - first vatriable then frame
#### select_multiple: first rename, then cast them & then merge with parent frame

#enmrtor_obsrvtons_referrals_to$


names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_CREATION_DATE"] <- "creation_date"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_PARENT_AURI"] <- "parent_auri"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "_URI"] <- "uri"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "BREAST_MILK"] <- "child_food_consuption_and_food_sources.child_food_consumed.breast_milk"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_CERELAC_CONSIMPTION"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_cerelac_consimption"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_FOODS_CONSUMED_DIARY"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_diary"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_FOODS_CONSUMED_EGGS"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_eggs"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_FOODS_CONSUMED_GRAINS"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_grains"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_FOODS_CONSUMED_MEAT"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_meat"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_FOODS_CONSUMED_NUTS"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_nuts"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_FOODS_CONSUMED_VEG"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_veg"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_FOODS_CONSUMED_VITA_A"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_vitaA"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_MILK_CONSUMPTION"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_milk_consumption"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "CHILD_SOLID_FOOD_CONSIMPTION"] <- "child_food_consuption_and_food_sources.child_food_consumed.child_solid_food_consimption"
names(child_fo22_sources_child_food_consumed)[names(child_fo22_sources_child_food_consumed) == "Server"] <- "server"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_CREATION_DATE"] <- "creation_date"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_PARENT_AURI"] <- "parent_auri"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "_URI"] <- "uri"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "Server"] <- "server"
names(enmrtor_obsrvtons_referrals_to)[names(enmrtor_obsrvtons_referrals_to) == "VALUE"] <- "enumarator_observations.referrals_to"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_CREATION_DATE"] <- "creation_date"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_PARENT_AURI"] <- "parent_auri"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "_URI"] <- "uri"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "FOOD_CONSUMED"] <- "food_consuption_and_food_sources.food_consumption.food_consumed"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "FOOD_COUNSUMPTION_PATTERN"] <- "food_consuption_and_food_sources.food_consumption.food_counsumption_pattern"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "FOOD_SOURCE"] <- "food_consuption_and_food_sources.food_consumption.food_source"
names(fodcnsptnndfdsrces_food_consumption)[names(fodcnsptnndfdsrces_food_consumption) == "Server"] <- "server"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_CREATION_DATE"] <- "creation_date"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_PARENT_AURI"] <- "parent_auri"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "_URI"] <- "uri"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "Server"] <- "server"
names(hoshld_membr_dtils_specific_needs_progres)[names(hoshld_membr_dtils_specific_needs_progres) == "VALUE"] <- "household.household_member.household_member_details.specific_needs_progres"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "Server"] <- "server"
names(hoshldmmbermrdtils_how_did_u_raise_money)[names(hoshldmmbermrdtils_how_did_u_raise_money) == "VALUE"] <- "household.household_member.household_member_more_details.how_did_u_raise_money"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "Server"] <- "server"
names(hoshldmmbermrdtils_how_start_work)[names(hoshldmmbermrdtils_how_start_work) == "VALUE"] <- "household.household_member.household_member_more_details.how_start_work"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "Server"] <- "server"
names(hoshldmmbermrdtils_not_employeed_reasons)[names(hoshldmmbermrdtils_not_employeed_reasons) == "VALUE"] <- "household.household_member.household_member_more_details.not_employeed_reasons"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "Server"] <- "server"
names(hoshldmmbermrdtils_occupation_pro_gres_coa)[names(hoshldmmbermrdtils_occupation_pro_gres_coa) == "VALUE"] <- "household.household_member.household_member_more_details.occupation_proGres_coa"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "Server"] <- "server"
names(hoshldmmbermrdtils_occupation_pro_gres_coo)[names(hoshldmmbermrdtils_occupation_pro_gres_coo) == "VALUE"] <- "household.household_member.household_member_more_details.occupation_proGres_coo"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "Server"] <- "server"
names(hoshldmmbermrdtils_skill)[names(hoshldmmbermrdtils_skill) == "VALUE"] <- "household.household_member.household_member_more_details.skill"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "Server"] <- "server"
names(hoshldmmbermrdtils_support_needed)[names(hoshldmmbermrdtils_support_needed) == "VALUE"] <- "household.household_member.household_member_more_details.support_needed"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_CREATION_DATE"] <- "creation_date"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_PARENT_AURI"] <- "parent_auri"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "_URI"] <- "uri"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "Server"] <- "server"
names(hoshldmmbermrdtils_type_of_business)[names(hoshldmmbermrdtils_type_of_business) == "VALUE"] <- "household.household_member.household_member_more_details.type_of_business"
names(household)[names(household) == "_CREATION_DATE"] <- "creation_date"
names(household)[names(household) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(household)[names(household) == "_IS_COMPLETE"] <- "is_complete"
names(household)[names(household) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(household)[names(household) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(household)[names(household) == "_MARKED_AS_COMPLETE_DATE"] <- "marked_as_complete_date"
names(household)[names(household) == "_MODEL_VERSION"] <- "model_version"
names(household)[names(household) == "_SUBMISSION_DATE"] <- "submission_date"
names(household)[names(household) == "_UI_VERSION"] <- "ui_version"
names(household)[names(household) == "_URI"] <- "uri"
names(household)[names(household) == "BIODATA_OBSERVATIONS"] <- "biodata_observations"
names(household)[names(household) == "CHILD_FOOD_CONSUPTION_AND_FOOD_SOURCES_NUMBER_OF_CHILDREN"] <- "child_food_consuption_and_food_sources.number_of_children"
names(household)[names(household) == "CONSENT_CONSENT_RELEASE"] <- "consent.consent_release"
names(household)[names(household) == "COPING_MECH_OBSERVATIONS"] <- "coping_mech_observations"
names(household)[names(household) == "COUNTRY"] <- "country"
names(household)[names(household) == "DEVICEID"] <- "deviceid"
names(household)[names(household) == "DISTRICT"] <- "district"
names(household)[names(household) == "END"] <- "end"
names(household)[names(household) == "ENUMARATOR_OBSERVATIONS_GENERAL_OBSERVATIONS"] <- "enumarator_observations.general_observations"
names(household)[names(household) == "ENUMARATOR_OBSERVATIONS_MAIN_UNMETS_NEEDS_1"] <- "enumarator_observations.main_unmets_needs_1"
names(household)[names(household) == "ENUMARATOR_OBSERVATIONS_MAIN_UNMETS_NEEDS_2"] <- "enumarator_observations.main_unmets_needs_2"
names(household)[names(household) == "ENUMARATOR_OBSERVATIONS_MAIN_UNMETS_NEEDS_3"] <- "enumarator_observations.main_unmets_needs_3"
names(household)[names(household) == "ENUMARATOR_OBSERVATIONS_REFERRAL_PRIORITIZATION"] <- "enumarator_observations.referral_prioritization"
names(household)[names(household) == "ENUMARATOR_OBSERVATIONS_VULNERABILITY_THRESHOLDS_EC"] <- "enumarator_observations.vulnerability_thresholds_EC"
names(household)[names(household) == "ENUMARATOR_OBSERVATIONS_VULNERABILITY_THRESHOLDS_PRO"] <- "enumarator_observations.vulnerability_thresholds_Pro"
names(household)[names(household) == "FOD_CNSPTION_AND_FOD_SRCES_NUMBER_OF_MEALS_WERE_EATEN"] <- "food_consuption_and_food_sources.number_of_meals_were_eaten"
names(household)[names(household) == "FOOD_QUESTION"] <- "food_question"
names(household)[names(household) == "GENERAL_INFORMATION_DETAILED_ADDRESS"] <- "general_information.detailed_address"
names(household)[names(household) == "GENERAL_INFORMATION_DETAILED_ADDRESS_APTNUMBER"] <- "general_information.detailed_address_aptnumber"
names(household)[names(household) == "GENERAL_INFORMATION_DETAILED_ADDRESS_BUILDING"] <- "general_information.detailed_address_building"
names(household)[names(household) == "GENERAL_INFORMATION_DETAILED_ADDRESS_FLOOR"] <- "general_information.detailed_address_floor"
names(household)[names(household) == "GENERAL_INFORMATION_GEOPOINT_LOCATION_ACC"] <- "general_information.geopoint_location.acc"
names(household)[names(household) == "GENERAL_INFORMATION_GEOPOINT_LOCATION_ALT"] <- "general_information.geopoint_location.alt"
names(household)[names(household) == "GENERAL_INFORMATION_GEOPOINT_LOCATION_LAT"] <- "general_information.geopoint_location.lat"
names(household)[names(household) == "GENERAL_INFORMATION_GEOPOINT_LOCATION_LNG"] <- "general_information.geopoint_location.lon"
names(household)[names(household) == "GENERAL_INFORMATION_INTERVIEW_DATE"] <- "general_information.interview_date"
names(household)[names(household) == "GENERAL_INFORMATION_INTERVIEW_TYPE"] <- "general_information.interview_type"
names(household)[names(household) == "GENERAL_INFORMATION_NAME_OF_INTERVIEWER_1"] <- "general_information.name_of_Interviewer_1"
names(household)[names(household) == "GENERAL_INFORMATION_NAME_OF_INTERVIEWER_2"] <- "general_information.name_of_Interviewer_2"
names(household)[names(household) == "GENERAL_INFORMATION_NUMBER_OF_HOUSEHOLD_MEMBERS"] <- "general_information.number_of_household_members"
names(household)[names(household) == "GOVERNORATE"] <- "governorate"
names(household)[names(household) == "INC_EXP_OBSERVATIONS"] <- "inc_exp_observations"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI1"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI1"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI10"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI10"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI11"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI11"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI12"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI12"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI13"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI13"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI14"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI14"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI15"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI15"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI16"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI16"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI17"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI17"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI18"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI18"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI19"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI19"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI2"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI2"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI20"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI20"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI21"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI21"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI3"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI3"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI4"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI4"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI5"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI5"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI6"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI6"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI7"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI7"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI8"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI8"
names(household)[names(household) == "LIVING_CONDITIONS_HH_ITEMS_LIST_HHITEM_OWNERSHIP_HHI9"] <- "living_conditions.HH_items_list.hhitem_ownership_HHI9"
names(household)[names(household) == "LIVING_CONDITIONS_TYPE_OF_HOUSING_OF_HH_IN_HOST_COUNTRY"] <- "living_conditions.type_of_housing_of_HH_in_host_country"
names(household)[names(household) == "LIVING_CONDITIONS_TYPE_OF_OCCUPANCY"] <- "living_conditions.type_of_occupancy"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_BATHROOM_USE"] <- "living_conditions.living_conditions_details.bathroom_use"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_DOORLOCK"] <- "living_conditions.living_conditions_details.doorlock"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_HHVENTILATION"] <- "living_conditions.living_conditions_details.hhventilation"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_HOUSE_RENT_PRICE"] <- "living_conditions.living_conditions_details.house_rent_price"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_LIVING_SPACE"] <- "living_conditions.living_conditions_details.living_space"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_NUMBER_OF_ROOMS"] <- "living_conditions.living_conditions_details.number_of_rooms"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_PEOPLE_SHARING_LIVING_SPACE"] <- "living_conditions.living_conditions_details.people_sharing_living_space"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_PEOPLE_SHARING_TOILET"] <- "living_conditions.living_conditions_details.people_sharing_toilet"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_SANITATION"] <- "living_conditions.living_conditions_details.sanitation"
names(household)[names(household) == "LIVNG_CNDTONS_LIVING_CONDITNS_DTILS_TENANCY_AGREEMENT"] <- "living_conditions.living_conditions_details.tenancy_agreement"
names(household)[names(household) == "MAIN_INCOMES_EXPENDITURES_SAVINGS_INCOME_OUT_EGY"] <- "main_incomes_expenditures.Savings.income_outEgy"
names(household)[names(household) == "MAIN_INCOMES_EXPENDITURES_SAVINGS_SAVING_AMOUNT"] <- "main_incomes_expenditures.Savings.saving_amount"
names(household)[names(household) == "MAN_NCMS_XPENDITURES_SPNT_MNT_LST_MONTH_DEPT_YES_NO"] <- "main_incomes_expenditures.spent_amount_last_month.dept_yes_no"
names(household)[names(household) == "MAN_NCMS_XPENDITURES_SPNT_MNT_LST_MONTH_MINIMUM_AMOUNT_OF_MONEY"] <- "main_incomes_expenditures.spent_amount_last_month.minimum_amount_of_money"
names(household)[names(household) == "MAN_NCMS_XPENDITURES_SPNT_MNT_LST_MONTH_UNEXPECTED_EXPENSES"] <- "main_incomes_expenditures.spent_amount_last_month_more_details.unexpected_expenses_reason"
names(household)[names(household) == "MANNCMSXPNDTRSSPENTMNTLSTMNTHMRDTILS_TOTAL_DEPT"] <- "main_incomes_expenditures.spent_amount_last_month_more_details.total_dept"
names(household)[names(household) == "MANNCMSXPNDTRSSPENTMNTLSTMNTHMRDTILS_UNEXPECTED_EXPENSES_AMOUNT"] <- "main_incomes_expenditures.spent_amount_last_month_more_details.unexpected_expenses_amount"
names(household)[names(household) == "META_INSTANCE_ID"] <- "meta_instance_id"
names(household)[names(household) == "PHONENUMBER"] <- "phonenumber"
names(household)[names(household) == "REVIEW_FORM_REVIEWED"] <- "review_form_reviewed"
names(household)[names(household) == "REVIEW_FORM_REVIEWER"] <- "review_form_reviewer"
names(household)[names(household) == "Server"] <- "server"
names(household)[names(household) == "SIMSERIAL"] <- "simserial"
names(household)[names(household) == "START"] <- "start"
names(household)[names(household) == "SUBSCRIBERID"] <- "subscriberid"
names(household)[names(household) == "TODAY"] <- "today"
names(household_household_member)[names(household_household_member) == "_CREATION_DATE"] <- "creation_date"
names(household_household_member)[names(household_household_member) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(household_household_member)[names(household_household_member) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(household_household_member)[names(household_household_member) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(household_household_member)[names(household_household_member) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(household_household_member)[names(household_household_member) == "_PARENT_AURI"] <- "parent_auri"
names(household_household_member)[names(household_household_member) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(household_household_member)[names(household_household_member) == "_URI"] <- "uri"
names(household_household_member)[names(household_household_member) == "EMPLOYMENT_FREQUENCY"] <- "household.household_member.employment_frequency"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_ASSESSED_OR_NOT"] <- "household.household_member.household_member_details.assessed_or_not"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_CASE_NUMBER_DEFAULT"] <- "household.household_member.household_member_details.case_number_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_CONTRIBUTE"] <- "household.household_member.household_member_details.contribute"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_EMPLOYMENT_STATUS"] <- "household.household_member.household_member_details.employment_status"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_FAMILY_NAME_DEFAULT"] <- "household.household_member.household_member_details.family_name_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_GIVEN_NAME_DEFAULT"] <- "household.household_member.household_member_details.given_name_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_HAS_VALID_RESIDENCY_PERMIT"] <- "household.household_member.household_member_details.has_valid_residency_permit"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_INDIVIDUAL_NUMBER"] <- "household.household_member.household_member_details.individual_number"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_LEVEL_OF_EDUCATION"] <- "household.household_member.household_member_details.level_of_education"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_MARITAL_STATUS"] <- "household.household_member.household_member_details.marital_status"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_NATIONALITY_DEFAULT"] <- "household.household_member.household_member_details.nationality_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_PASSPORT_NUMBER_DEFAULT"] <- "household.household_member.household_member_details.passport_number_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_PASSPORT_VALIDITY"] <- "household.household_member.household_member_details.passport_validity"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_PHONE_NUMBER_DEFAULT"] <- "household.household_member.household_member_details.phone_number_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_PHYSICAL_PRESENCE"] <- "household.household_member.household_member_details.physical_presence"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_REGISTERED"] <- "household.household_member.household_member_details.registered"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_RELATION_TO_HEAD_OF_HH"] <- "household.household_member.household_member_details.relation_to_head_of_HH"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_DETAILS_SEX_DEFAULT"] <- "household.household_member.household_member_details.sex_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_ASSESSED_NOT"] <- "household.household_member.household_member_details.assessed_or_not"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_CAPITAL_NEEDED_FOR_STARTUP_EGP"] <- "household.household_member.household_member_more_details.capital_needed_for_startup_egp"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_CASE_NUMBER"] <- "household.household_member.household_member_more_details.case_number"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_DATE_OF_BIRTH_DEFAULT"] <- "household.household_member.household_member_more_details.date_of_birth_default"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_FAMILY_NAME"] <- "household.household_member.household_member_more_details.family_name"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_GIVEN_NAME"] <- "household.household_member.household_member_more_details.given_name"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_HAS_RESIDENCY_PERMIT_ON"] <- "household.household_member.household_member_more_details.has_residency_permit_on"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_LEVEL_OF_SATISFACTION"] <- "household.household_member.household_member_more_details.level_of_satisfaction"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_NATIONALITY"] <- "household.household_member.household_member_more_details.nationality"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_NUMBER_OF_EMPLOYEES_EGY"] <- "household.household_member.household_member_more_details.number_of_employees_EGY"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_NUMBER_OF_EMPLOYEES_OTHER"] <- "household.household_member.household_member_more_details.number_of_employees_OTHER"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_NUMBER_OF_EMPLOYEES_SYR"] <- "household.household_member.household_member_more_details.number_of_employees_SYR"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_PASSPORT_NUMBER"] <- "household.household_member.household_member_more_details.passport_number"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_PHONE_NUMBER"] <- "household.household_member.household_member_more_details.phone_number"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_SEEK_HEALTH_PLACE"] <- "household.household_member.household_member_more_details.seek_health_place"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_SEX"] <- "household.household_member.household_member_more_details.sex"
names(household_household_member)[names(household_household_member) == "HOUSEHOLD_MEMBER_MORE_DETAILS_TRAVELED"] <- "household.household_member.household_member_more_details.traveled"
names(household_household_member)[names(household_household_member) == "MAIN_HOUSEHOLD_MORE_DETAILS_1_CHILD_CAREGIVER_2"] <- "household.household_member.main_household_more_details_1.child_caregiver_2"
names(household_household_member)[names(household_household_member) == "MAIN_HOUSEHOLD_MORE_DETAILS_1_CHILD_LEGAL_PR"] <- "household.household_member.main_household_more_details_1.child_legal_pr"
names(household_household_member)[names(household_household_member) == "MAIN_HOUSEHOLD_MORE_DETAILS_1_CHILD_VIOLENCE_PLACE"] <- "household.household_member.main_household_more_details_1.child_violence_place"
names(household_household_member)[names(household_household_member) == "MAIN_HOUSEHOLD_MORE_DETAILS_1_CHILD_WORK"] <- "household.household_member.main_household_more_details_1.child_work"
names(household_household_member)[names(household_household_member) == "MAIN_HOUSEHOLD_MORE_DETAILS_1_CHILD_WORK_PLACE_SPICIFY"] <- "household.household_member.main_household_more_details_1.child_work_place_spicify"
names(household_household_member)[names(household_household_member) == "MAIN_HOUSEHOLD_MORE_DETAILS_1_NOT_SEEKING_WORK_OTHER"] <- "household.household_member.main_household_more_details_1.not_seeking_work_other"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILD_BIRTH_CERTIFICATE"] <- "household.household_member.main_household_more_details_1.child_details.child_birth_certificate"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILD_CAREGIVER"] <- "household.household_member.main_household_more_details_1.child_details.child_caregiver"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILD_EMPLOYMENT_STATUS"] <- "household.household_member.main_household_more_details_1.child_details.child_employment_status"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILD_MARRIAGE_Q"] <- "household.household_member.main_household_more_details_1.child_details.child_marriage_q"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILD_PLANE_MARRIAGE"] <- "household.household_member.main_household_more_details_1.child_details.child_plane_marriage"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILD_VIOLENCE"] <- "household.household_member.main_household_more_details_1.child_details.child_Violence"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILDREN_WORKING_HOURS"] <- "household.household_member.main_household_more_details_1.child_details.children_working_hours"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_CHILDREN_WORKING_PLACE"] <- "household.household_member.main_household_more_details_1.child_details.children_working_place"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_GO_TO_SCHOOL"] <- "household.household_member.main_household_more_details_1.child_details.go_to_school"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_TYPE_OF_WORK"] <- "household.household_member.main_household_more_details_1.child_details.type_of_work"
names(household_household_member)[names(household_household_member) == "MAN_HSHLD_MORE_DETLS_1_CHLD_DTILS_WORK_AFFECT_SCHOOL_ATTENDENCE"] <- "household.household_member.main_household_more_details_1.child_details.work_affect_school_attendence"
names(household_household_member)[names(household_household_member) == "MANHSHLDMRDTALS1NTTNDNGSCHLRSONS_CHILD_BIRTH_CERTIFICATE_PROESS"] <- "household.household_member.main_household_more_details_1.not_attending_school_reasons.child_birth_certificate_proess"
names(household_household_member)[names(household_household_member) == "MANHSHLDMRDTALS1NTTNDNGSCHLRSONS_CHILD_SCHL_GRADE"] <- "household.household_member.main_household_more_details_1.not_attending_school_reasons.child_schl_grade"
names(household_household_member)[names(household_household_member) == "MANHSHLDMRDTALS1NTTNDNGSCHLRSONS_SCHOOL_TYPE"] <- "household.household_member.main_household_more_details_1.not_attending_school_reasons.school_type"
names(household_household_member)[names(household_household_member) == "MANHSHLDMRDTALS1NTTNDNGSCHLRSONS_VIOLENCE_PLACE_OTHER"] <- "household.household_member.main_household_more_details_1.not_attending_school_reasons.violence_place_other"
names(household_household_member)[names(household_household_member) == "OTHER_JOBS"] <- "household.household_member.other_jobs"
names(household_household_member)[names(household_household_member) == "OTHER_SKILL"] <- "household.household_member.other_skill"
names(household_household_member)[names(household_household_member) == "OTHER_SUPPORT"] <- "household.household_member.other_support"
names(household_household_member)[names(household_household_member) == "PHYSICAL_DISABILITYS"] <- "household.household_member.physical_disabilitys"
names(household_household_member)[names(household_household_member) == "Server"] <- "server"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_CREATION_DATE"] <- "creation_date"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_PARENT_AURI"] <- "parent_auri"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "_URI"] <- "uri"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "IMMIGRATION_MECHANISM"] <- "household_coping_strategy.immigration.immigration_mechanism"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "IMMIGRATION_PATTERN"] <- "household_coping_strategy.immigration.immigration_pattern"
names(hshld_cpng_strtgy_immigration)[names(hshld_cpng_strtgy_immigration) == "Server"] <- "server"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_CREATION_DATE"] <- "creation_date"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_PARENT_AURI"] <- "parent_auri"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "_URI"] <- "uri"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "Server"] <- "server"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "STRATEGY_FOR_LONG_TERM_ITEM"] <- "household_coping_strategy.strategies_for_long_term.strategy_for_long_term_item"
names(hshld_cpng_strtgy_strategies_for_long_term)[names(hshld_cpng_strtgy_strategies_for_long_term) == "YEARLY_COPING_PATTERN"] <- "household_coping_strategy.strategies_for_long_term.yearly_coping_pattern"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_CREATION_DATE"] <- "creation_date"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_PARENT_AURI"] <- "parent_auri"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "_URI"] <- "uri"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "FOOD_COPING_PATTERN"] <- "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_pattern"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "FOOD_COPING_STRATEGY"] <- "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_strategy"
names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food)[names(hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food) == "Server"] <- "server"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_CREATION_DATE"] <- "creation_date"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_PARENT_AURI"] <- "parent_auri"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "_URI"] <- "uri"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "Server"] <- "server"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "STRATEGY_TO_MEET_BASIC_NEEDS"] <- "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs"
names(hshld_cpng_strtgy_strategies_to_meet_basic_needs)[names(hshld_cpng_strtgy_strategies_to_meet_basic_needs) == "STRATEGY_TO_MEET_BASIC_NEEDS_USED"] <- "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs_used"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_CREATION_DATE"] <- "creation_date"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_PARENT_AURI"] <- "parent_auri"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "_URI"] <- "uri"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "Server"] <- "server"
names(main_hou27_details_work_kind_child)[names(main_hou27_details_work_kind_child) == "VALUE"] <- "household.household_member.main_household_more_details_1.child_details.work_kind_child"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_CREATION_DATE"] <- "creation_date"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_PARENT_AURI"] <- "parent_auri"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "_URI"] <- "uri"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "Server"] <- "server"
names(main_hou42_reasons_not_attending_school_reason_1)[names(main_hou42_reasons_not_attending_school_reason_1) == "VALUE"] <- "household.household_member.main_household_more_details_1.not_attending_school_reasons.not_attending_school_reason_1"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_CREATION_DATE"] <- "creation_date"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "_URI"] <- "uri"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "Server"] <- "server"
names(main_inc33st_month_bill_verfication)[names(main_inc33st_month_bill_verfication) == "VALUE"] <- "main_incomes_expenditures.spent_amount_last_month.bill_verfication"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_CREATION_DATE"] <- "creation_date"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "_URI"] <- "uri"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "EXPENDITURE_ITEMS_CATEGORY"] <- "main_incomes_expenditures.spent_amount_last_month.expenditures.expenditure_items_category"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "EXPENDITURE_ITEMS_VALUE"] <- "main_incomes_expenditures.spent_amount_last_month.expenditures.expenditure_items_value"
names(main_inc33st_month_expenditures)[names(main_inc33st_month_expenditures) == "Server"] <- "server"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_CREATION_DATE"] <- "creation_date"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "_URI"] <- "uri"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "AMOUNT_OF_INCOME"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.amount_of_income"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "ASSISTANCE_PERIOD"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.assistance_period"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "Server"] <- "server"
names(main_inc36y_source_source_of_income_assistance_1)[names(main_inc36y_source_source_of_income_assistance_1) == "SOURCE_OF_INCOME_ASSISTANCE"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.source_of_income_assistance"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_CREATION_DATE"] <- "creation_date"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "_URI"] <- "uri"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "ASSISTANCE_PERIOD"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.assistance_period"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "REMITTANCES_FREQUENCY_REGULAR"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.remittances_frequency_regular"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "Server"] <- "server"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "SOURCE_OF_INCOME_REITTANCES"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.source_of_income_reittances"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "TYPE_OF_EXTERNAL_SOURCE"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source"
names(main_inc36y_source_source_of_income_external_4)[names(main_inc36y_source_source_of_income_external_4) == "TYPE_OF_TRANSFER"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_transfer"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_CREATION_DATE"] <- "creation_date"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "_URI"] <- "uri"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "AMOUNT_OF_INCOME"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.amount_of_income"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "Server"] <- "server"
names(main_inc36y_source_source_of_income_neg_coping_3)[names(main_inc36y_source_source_of_income_neg_coping_3) == "SOURCE_OF_INCOME_NEGATIVE_COPING"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.source_of_income_negative_coping"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_CREATION_DATE"] <- "creation_date"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "_URI"] <- "uri"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "Server"] <- "server"
names(main_inc46_details_dept_source)[names(main_inc46_details_dept_source) == "VALUE"] <- "main_incomes_expenditures.spent_amount_last_month_more_details.dept_source"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_CREATION_DATE"] <- "creation_date"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "_URI"] <- "uri"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "Server"] <- "server"
names(main_inc46_details_how_repay_dept)[names(main_inc46_details_how_repay_dept) == "VALUE"] <- "main_incomes_expenditures.spent_amount_last_month_more_details.how_repay_dept"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_CREATION_DATE"] <- "creation_date"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "_URI"] <- "uri"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "Server"] <- "server"
names(main_inc46_details_source_of_income)[names(main_inc46_details_source_of_income) == "VALUE"] <- "main_incomes_expenditures.spent_amount_last_month_more_details.source_of_income"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_CREATION_DATE"] <- "creation_date"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_PARENT_AURI"] <- "parent_auri"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "_URI"] <- "uri"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "Server"] <- "server"
names(main_inc46_details_unexpected_expenses_reason)[names(main_inc46_details_unexpected_expenses_reason) == "VALUE"] <- "main_incomes_expenditures.spent_amount_last_month_more_details.unexpected_expenses_reason"
names(not_satisfied_work)[names(not_satisfied_work) == "_CREATION_DATE"] <- "creation_date"
names(not_satisfied_work)[names(not_satisfied_work) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(not_satisfied_work)[names(not_satisfied_work) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(not_satisfied_work)[names(not_satisfied_work) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(not_satisfied_work)[names(not_satisfied_work) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(not_satisfied_work)[names(not_satisfied_work) == "_PARENT_AURI"] <- "parent_auri"
names(not_satisfied_work)[names(not_satisfied_work) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(not_satisfied_work)[names(not_satisfied_work) == "_URI"] <- "uri"
names(not_satisfied_work)[names(not_satisfied_work) == "Server"] <- "server"
names(not_satisfied_work)[names(not_satisfied_work) == "VALUE"] <- "household.household_member.not_satisfied_work"
names(not_seeking_work)[names(not_seeking_work) == "_CREATION_DATE"] <- "creation_date"
names(not_seeking_work)[names(not_seeking_work) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(not_seeking_work)[names(not_seeking_work) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(not_seeking_work)[names(not_seeking_work) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(not_seeking_work)[names(not_seeking_work) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(not_seeking_work)[names(not_seeking_work) == "_PARENT_AURI"] <- "parent_auri"
names(not_seeking_work)[names(not_seeking_work) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(not_seeking_work)[names(not_seeking_work) == "_URI"] <- "uri"
names(not_seeking_work)[names(not_seeking_work) == "Server"] <- "server"
names(not_seeking_work)[names(not_seeking_work) == "VALUE"] <- "household.household_member.not_seeking_work"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_CREATION_DATE"] <- "creation_date"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_PARENT_AURI"] <- "parent_auri"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(reasons_of_borrow)[names(reasons_of_borrow) == "_URI"] <- "uri"
names(reasons_of_borrow)[names(reasons_of_borrow) == "Server"] <- "server"
names(reasons_of_borrow)[names(reasons_of_borrow) == "VALUE"] <- "main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_CREATION_DATE"] <- "creation_date"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_CREATOR_URI_USER"] <- "creator_uri_user"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_LAST_UPDATE_DATE"] <- "last_update_date"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_LAST_UPDATE_URI_USER"] <- "last_update_uri_user"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_ORDINAL_NUMBER"] <- "ordinal_number"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_PARENT_AURI"] <- "parent_auri"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_TOP_LEVEL_AURI"] <- "top_level_auri"
names(source_of_income_work_2)[names(source_of_income_work_2) == "_URI"] <- "uri"
names(source_of_income_work_2)[names(source_of_income_work_2) == "AMOUNT_OF_INCOME"] <- "household.household_member.source_of_income_work_2.amount_of_income"
names(source_of_income_work_2)[names(source_of_income_work_2) == "Server"] <- "server"
names(source_of_income_work_2)[names(source_of_income_work_2) == "SOURCE_OF_INCOME_WORK"] <- "household.household_member.source_of_income_work_2.source_of_income_work"


## Now rename frame
child_food_consumed <- child_fo22_sources_child_food_consumed
food_consumption <- fodcnsptnndfdsrces_food_consumption
household <- household
household_member <- household_household_member
immigration <- hshld_cpng_strtgy_immigration
source_of_income_assistance_1 <- main_inc36y_source_source_of_income_assistance_1
source_of_income_external_4 <- main_inc36y_source_source_of_income_external_4
source_of_income_neg_coping_3 <- reasons_of_borrow
source_of_income_work_2 <- source_of_income_work_2
strategies_for_long_term <- hshld_cpng_strtgy_strategies_for_long_term
strategies_to_cope_with_a_lack_of_food <- hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food
strategies_to_meet_basic_needs <- hshld_cpng_strtgy_strategies_to_meet_basic_needs
expenditures <- main_inc33st_month_expenditures

rm(child_fo22_sources_child_food_consumed,
   fodcnsptnndfdsrces_food_consumption,
  # household,
   household_household_member,
   hshld_cpng_strtgy_immigration,
   main_inc36y_source_source_of_income_assistance_1,
   main_inc36y_source_source_of_income_external_4,
   reasons_of_borrow,
  # source_of_income_work_2,
   hshld_cpng_strtgy_strategies_for_long_term,
   hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food,
   hshld_cpng_strtgy_strategies_to_meet_basic_needs,
   main_inc33st_month_expenditures)

## Remving unnecssary column before casting:
enmrtor_obsrvtons_referrals_to[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_hou27_details_work_kind_child[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_hou42_reasons_not_attending_school_reason_1[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_inc33st_month_bill_verfication[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_inc46_details_dept_source[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_inc46_details_how_repay_dept[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_inc46_details_source_of_income[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_inc46_details_unexpected_expenses_reason[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshld_membr_dtils_specific_needs_progres[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_how_did_u_raise_money[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_how_start_work[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_not_employeed_reasons[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_occupation_pro_gres_coa[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_occupation_pro_gres_coo[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_skill[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_support_needed[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
hoshldmmbermrdtils_type_of_business[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
not_satisfied_work[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
not_seeking_work[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL
main_inc36y_source_source_of_income_neg_coping_3[ ,c("creation_date","creator_uri_user","last_update_date","last_update_uri_user","ordinal_number","top_level_auri","uri","server")] <- NULL

## Now casting
require(reshape2)

enmrtor_obsrvtons_referrals_to.cast <- dcast(enmrtor_obsrvtons_referrals_to , as.formula(paste("parent_auri", names(enmrtor_obsrvtons_referrals_to)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
main_hou27_details_work_kind_child.cast <- dcast(main_hou27_details_work_kind_child , as.formula(paste("parent_auri", names(main_hou27_details_work_kind_child)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
main_hou42_reasons_not_attending_school_reason_1.cast <- dcast(main_hou42_reasons_not_attending_school_reason_1 , as.formula(paste("parent_auri", names(main_hou42_reasons_not_attending_school_reason_1)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
main_inc33st_month_bill_verfication.cast <- dcast(main_inc33st_month_bill_verfication , as.formula(paste("parent_auri", names(main_inc33st_month_bill_verfication)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
main_inc46_details_dept_source.cast <- dcast(main_inc46_details_dept_source , as.formula(paste("parent_auri", names(main_inc46_details_dept_source)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
main_inc46_details_how_repay_dept.cast <- dcast(main_inc46_details_how_repay_dept , as.formula(paste("parent_auri", names(main_inc46_details_how_repay_dept)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
main_inc46_details_source_of_income.cast <- dcast(main_inc46_details_source_of_income , as.formula(paste("parent_auri", names(main_inc46_details_source_of_income)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
main_inc46_details_unexpected_expenses_reason.cast <- dcast(main_inc46_details_unexpected_expenses_reason , as.formula(paste("parent_auri", names(main_inc46_details_unexpected_expenses_reason)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshld_membr_dtils_specific_needs_progres.cast <- dcast(hoshld_membr_dtils_specific_needs_progres , as.formula(paste("parent_auri", names(hoshld_membr_dtils_specific_needs_progres)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_how_did_u_raise_money.cast <- dcast(hoshldmmbermrdtils_how_did_u_raise_money , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_how_did_u_raise_money)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_how_start_work.cast <- dcast(hoshldmmbermrdtils_how_start_work , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_how_start_work)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_not_employeed_reasons.cast <- dcast(hoshldmmbermrdtils_not_employeed_reasons , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_not_employeed_reasons)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_occupation_pro_gres_coa.cast <- dcast(hoshldmmbermrdtils_occupation_pro_gres_coa , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_occupation_pro_gres_coa)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_occupation_pro_gres_coo.cast <- dcast(hoshldmmbermrdtils_occupation_pro_gres_coo , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_occupation_pro_gres_coo)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_skill.cast <- dcast(hoshldmmbermrdtils_skill , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_skill)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_support_needed.cast <- dcast(hoshldmmbermrdtils_support_needed , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_support_needed)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
hoshldmmbermrdtils_type_of_business.cast <- dcast(hoshldmmbermrdtils_type_of_business , as.formula(paste("parent_auri", names(hoshldmmbermrdtils_type_of_business)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
not_satisfied_work.cast <- dcast(not_satisfied_work , as.formula(paste("parent_auri", names(not_satisfied_work)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
not_seeking_work.cast <- dcast(not_seeking_work , as.formula(paste("parent_auri", names(not_seeking_work)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})
#main_inc36y_source_source_of_income_neg_coping_3.cast <- dcast(main_inc36y_source_source_of_income_neg_coping_3 , as.formula(paste("parent_auri", names(main_inc36y_source_source_of_income_neg_coping_3)[2], sep = "~")) , fun.aggregate = function(x){as.integer(length(x) > 0)})

## Now reanming column to full name
# i <- 1
for (i in 2:ncol(enmrtor_obsrvtons_referrals_to.cast)) {names(enmrtor_obsrvtons_referrals_to.cast)[i] <- paste( names(enmrtor_obsrvtons_referrals_to)[2], names(enmrtor_obsrvtons_referrals_to.cast)[i], sep = ".")}
for (i in 2:ncol(main_hou27_details_work_kind_child.cast)) {names(main_hou27_details_work_kind_child.cast)[i] <- paste( names(main_hou27_details_work_kind_child)[2], names(main_hou27_details_work_kind_child.cast)[i], sep = ".")}
for (i in 2:ncol(main_hou42_reasons_not_attending_school_reason_1.cast)) {names(main_hou42_reasons_not_attending_school_reason_1.cast)[i] <- paste( names(main_hou42_reasons_not_attending_school_reason_1)[2], names(main_hou42_reasons_not_attending_school_reason_1.cast)[i], sep = ".")}
for (i in 2:ncol(main_inc33st_month_bill_verfication.cast)) {names(main_inc33st_month_bill_verfication.cast)[i] <- paste( names(main_inc33st_month_bill_verfication)[2], names(main_inc33st_month_bill_verfication.cast)[i], sep = ".")}
for (i in 2:ncol(main_inc46_details_dept_source.cast)) {names(main_inc46_details_dept_source.cast)[i] <- paste( names(main_inc46_details_dept_source)[2], names(main_inc46_details_dept_source.cast)[i], sep = ".")}
for (i in 2:ncol(main_inc46_details_how_repay_dept.cast)) {names(main_inc46_details_how_repay_dept.cast)[i] <- paste( names(main_inc46_details_how_repay_dept)[2], names(main_inc46_details_how_repay_dept.cast)[i], sep = ".")}
for (i in 2:ncol(main_inc46_details_source_of_income.cast)) {names(main_inc46_details_source_of_income.cast)[i] <- paste( names(main_inc46_details_source_of_income)[2], names(main_inc46_details_source_of_income.cast)[i], sep = ".")}
for (i in 2:ncol(main_inc46_details_unexpected_expenses_reason.cast)) {names(main_inc46_details_unexpected_expenses_reason.cast)[i] <- paste( names(main_inc46_details_unexpected_expenses_reason)[2], names(main_inc46_details_unexpected_expenses_reason.cast)[i], sep = ".")}
for (i in 2:ncol(hoshld_membr_dtils_specific_needs_progres.cast)) {names(hoshld_membr_dtils_specific_needs_progres.cast)[i] <- paste( names(hoshld_membr_dtils_specific_needs_progres)[2], names(hoshld_membr_dtils_specific_needs_progres.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_how_did_u_raise_money.cast)) {names(hoshldmmbermrdtils_how_did_u_raise_money.cast)[i] <- paste( names(hoshldmmbermrdtils_how_did_u_raise_money)[2], names(hoshldmmbermrdtils_how_did_u_raise_money.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_how_start_work.cast)) {names(hoshldmmbermrdtils_how_start_work.cast)[i] <- paste( names(hoshldmmbermrdtils_how_start_work)[2], names(hoshldmmbermrdtils_how_start_work.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_not_employeed_reasons.cast)) {names(hoshldmmbermrdtils_not_employeed_reasons.cast)[i] <- paste( names(hoshldmmbermrdtils_not_employeed_reasons)[2], names(hoshldmmbermrdtils_not_employeed_reasons.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_occupation_pro_gres_coa.cast)) {names(hoshldmmbermrdtils_occupation_pro_gres_coa.cast)[i] <- paste( names(hoshldmmbermrdtils_occupation_pro_gres_coa)[2], names(hoshldmmbermrdtils_occupation_pro_gres_coa.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_occupation_pro_gres_coo.cast)) {names(hoshldmmbermrdtils_occupation_pro_gres_coo.cast)[i] <- paste( names(hoshldmmbermrdtils_occupation_pro_gres_coo)[2], names(hoshldmmbermrdtils_occupation_pro_gres_coo.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_skill.cast)) {names(hoshldmmbermrdtils_skill.cast)[i] <- paste( names(hoshldmmbermrdtils_skill)[2], names(hoshldmmbermrdtils_skill.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_support_needed.cast)) {names(hoshldmmbermrdtils_support_needed.cast)[i] <- paste( names(hoshldmmbermrdtils_support_needed)[2], names(hoshldmmbermrdtils_support_needed.cast)[i], sep = ".")}
for (i in 2:ncol(hoshldmmbermrdtils_type_of_business.cast)) {names(hoshldmmbermrdtils_type_of_business.cast)[i] <- paste( names(hoshldmmbermrdtils_type_of_business)[2], names(hoshldmmbermrdtils_type_of_business.cast)[i], sep = ".")}
for (i in 2:ncol(not_satisfied_work.cast)) {names(not_satisfied_work.cast)[i] <- paste( names(not_satisfied_work)[2], names(not_satisfied_work.cast)[i], sep = ".")}
for (i in 2:ncol(not_seeking_work.cast)) {names(not_seeking_work.cast)[i] <- paste( names(not_seeking_work)[2], names(not_seeking_work.cast)[i], sep = ".")}
#for (i in 2:ncol(main_inc36y_source_source_of_income_neg_coping_3.cast)) {names(main_inc36y_source_source_of_income_neg_coping_3.cast)[i] <- paste( names(main_inc36y_source_source_of_income_neg_coping_3)[2], names(main_inc36y_source_source_of_income_neg_coping_3.cast)[i], sep = ".")}

## Rename the uri key
names(enmrtor_obsrvtons_referrals_to.cast)[names(enmrtor_obsrvtons_referrals_to.cast) == "parent_auri"] <- "uri"
names(main_hou27_details_work_kind_child.cast)[names(main_hou27_details_work_kind_child.cast) == "parent_auri"] <- "uri"
names(main_hou42_reasons_not_attending_school_reason_1.cast)[names(main_hou42_reasons_not_attending_school_reason_1.cast) == "parent_auri"] <- "uri"
names(main_inc33st_month_bill_verfication.cast)[names(main_inc33st_month_bill_verfication.cast) == "parent_auri"] <- "uri"
names(main_inc46_details_dept_source.cast)[names(main_inc46_details_dept_source.cast) == "parent_auri"] <- "uri"
names(main_inc46_details_how_repay_dept.cast)[names(main_inc46_details_how_repay_dept.cast) == "parent_auri"] <- "uri"
names(main_inc46_details_source_of_income.cast)[names(main_inc46_details_source_of_income.cast) == "parent_auri"] <- "uri"
names(main_inc46_details_unexpected_expenses_reason.cast)[names(main_inc46_details_unexpected_expenses_reason.cast) == "parent_auri"] <- "uri"
names(hoshld_membr_dtils_specific_needs_progres.cast)[names(hoshld_membr_dtils_specific_needs_progres.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_how_did_u_raise_money.cast)[names(hoshldmmbermrdtils_how_did_u_raise_money.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_how_start_work.cast)[names(hoshldmmbermrdtils_how_start_work.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_not_employeed_reasons.cast)[names(hoshldmmbermrdtils_not_employeed_reasons.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_occupation_pro_gres_coa.cast)[names(hoshldmmbermrdtils_occupation_pro_gres_coa.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_occupation_pro_gres_coo.cast)[names(hoshldmmbermrdtils_occupation_pro_gres_coo.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_skill.cast)[names(hoshldmmbermrdtils_skill.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_support_needed.cast)[names(hoshldmmbermrdtils_support_needed.cast) == "parent_auri"] <- "uri"
names(hoshldmmbermrdtils_type_of_business.cast)[names(hoshldmmbermrdtils_type_of_business.cast) == "parent_auri"] <- "uri"
names(not_satisfied_work.cast)[names(not_satisfied_work.cast) == "parent_auri"] <- "uri"
names(not_seeking_work.cast)[names(not_seeking_work.cast) == "parent_auri"] <- "uri"
#names(main_inc36y_source_source_of_income_neg_coping_3.cast)[names(main_inc36y_source_source_of_income_neg_coping_3.cast) == "parent_auri"] <- "uri"


## Now merging to the correct frame
household <- merge(x = household, y = enmrtor_obsrvtons_referrals_to.cast, by = "uri", all.x = TRUE)
household <- merge(x = household, y = main_hou27_details_work_kind_child.cast, by = "uri", all.x = TRUE)
household <- merge(x = household, y = main_hou42_reasons_not_attending_school_reason_1.cast, by = "uri", all.x = TRUE)
household <- merge(x = household, y = main_inc33st_month_bill_verfication.cast, by = "uri", all.x = TRUE)
household <- merge(x = household, y = main_inc46_details_dept_source.cast, by = "uri", all.x = TRUE)
household <- merge(x = household, y = main_inc46_details_how_repay_dept.cast, by = "uri", all.x = TRUE)
household <- merge(x = household, y = main_inc46_details_source_of_income.cast, by = "uri", all.x = TRUE)
household <- merge(x = household, y = main_inc46_details_unexpected_expenses_reason.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshld_membr_dtils_specific_needs_progres.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_how_did_u_raise_money.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_how_start_work.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_not_employeed_reasons.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_occupation_pro_gres_coa.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_occupation_pro_gres_coo.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_skill.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_support_needed.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = hoshldmmbermrdtils_type_of_business.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = not_satisfied_work.cast, by = "uri", all.x = TRUE)
household_member <- merge(x = household_member, y = not_seeking_work.cast, by = "uri", all.x = TRUE)
#source_of_income_assistance_1 <- merge(x = source_of_income_assistance_1, y = main_inc36y_source_source_of_income_neg_coping_3.cast, by = "uri", all.x = TRUE)



write.csv(household,"data/evar3_household.csv", row.names = FALSE, na = "")
write.csv(household_member,"data/evar3_household_member.csv", row.names = FALSE, na = "")
write.csv(child_food_consumed,"data/evar3_child_food_consumed.csv", row.names = FALSE, na = "")
write.csv(food_consumption,"data/evar3_food_consumption.csv", row.names = FALSE, na = "")
write.csv(immigration,"data/evar3_immigration.csv", row.names = FALSE, na = "")
write.csv(source_of_income_assistance_1,"data/evar3_source_of_income_assistance_1.csv", row.names = FALSE, na = "")
write.csv(source_of_income_external_4,"data/evar3_source_of_income_external_4.csv", row.names = FALSE, na = "")
write.csv(source_of_income_neg_coping_3,"data/evar3_source_of_income_neg_coping_3.csv", row.names = FALSE, na = "")
write.csv(source_of_income_work_2,"data/evar3_source_of_income_work_2.csv", row.names = FALSE, na = "")
write.csv(strategies_for_long_term,"data/evar3_strategies_for_long_term.csv", row.names = FALSE, na = "")
write.csv(strategies_to_cope_with_a_lack_of_food,"data/evar3_strategies_to_cope_with_a_lack_of_food.csv", row.names = FALSE, na = "")
write.csv(strategies_to_meet_basic_needs,"data/evar3_strategies_to_meet_basic_needs.csv", row.names = FALSE, na = "")
write.csv(expenditures,"data/evar3_expenditures.csv", row.names = FALSE, na = "")

rm(#household,
   child_fo22_sources_child_food_consumed,
   enmrtor_obsrvtons_referrals_to,
   fodcnsptnndfdsrces_food_consumption,
   hoshld_membr_dtils_specific_needs_progres,
   hoshldmmbermrdtils_how_did_u_raise_money,
   hoshldmmbermrdtils_how_start_work,
   hoshldmmbermrdtils_not_employeed_reasons,
   hoshldmmbermrdtils_occupation_pro_gres_coa,
   hoshldmmbermrdtils_occupation_pro_gres_coo,
   hoshldmmbermrdtils_skill,
   hoshldmmbermrdtils_support_needed,
   hoshldmmbermrdtils_type_of_business,
   household_household_member,
   hshld_cpng_strtgy_immigration,
   hshld_cpng_strtgy_strategies_for_long_term,
   hshld_cpng_strtgy_strategies_to_cope_with_a_lack_of_food,
   hshld_cpng_strtgy_strategies_to_meet_basic_needs,
   main_hou27_details_work_kind_child,
   main_hou42_reasons_not_attending_school_reason_1,
   main_inc33st_month_bill_verfication,
   main_inc33st_month_expenditures,
   main_inc36y_source_source_of_income_assistance_1,
   main_inc36y_source_source_of_income_external_4,
   main_inc36y_source_source_of_income_neg_coping_3,
   main_inc46_details_dept_source,
   main_inc46_details_how_repay_dept,
   main_inc46_details_source_of_income,
   main_inc46_details_unexpected_expenses_reason,
   not_satisfied_work,
   not_seeking_work,
   reasons_of_borrow,
   source_of_income_work_2,enmrtor_obsrvtons_referrals_to.cast,
   main_hou27_details_work_kind_child.cast,
   main_hou42_reasons_not_attending_school_reason_1.cast,
   main_inc33st_month_bill_verfication.cast,
   main_inc46_details_dept_source.cast,
   main_inc46_details_how_repay_dept.cast,
   main_inc46_details_source_of_income.cast,
   main_inc46_details_unexpected_expenses_reason.cast,
   hoshld_membr_dtils_specific_needs_progres.cast,
   hoshldmmbermrdtils_how_did_u_raise_money.cast,
   hoshldmmbermrdtils_how_start_work.cast,
   hoshldmmbermrdtils_not_employeed_reasons.cast,
   hoshldmmbermrdtils_occupation_pro_gres_coa.cast,
   hoshldmmbermrdtils_occupation_pro_gres_coo.cast,
   hoshldmmbermrdtils_skill.cast,
   hoshldmmbermrdtils_support_needed.cast,
   hoshldmmbermrdtils_type_of_business.cast,
   not_satisfied_work.cast,
   not_seeking_work.cast  # main_inc36y_source_source_of_income_neg_coping_3.cast,

)
