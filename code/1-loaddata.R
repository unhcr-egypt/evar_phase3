rm(list = ls())

## Load all required packages         #############################################
source("code/0-packages.R")
#source("code/0-config.R")

### Double Check that you have the last version
#source("https://raw.githubusercontent.com/Edouard-Legoupil/koboloadeR/master/inst/script/install_github.R")
#install.packages("devtools")
#library("devtools")
#install_github("unhcr/koboloadeR")

library(koboloadeR)

## kobo_projectinit()
## Now Position your form & your data in the data folder

## function tu put 0 instead of NaN
is.nan.data.frame <- function(x)
  do.call(cbind, lapply(x, is.nan))



## Load form and building dictionnary #############################################
#rm(form)
form <- "form.xls"
## Generate & Load dictionnary
cat("\n\n\n Generate dictionnary from the xlsform \n\n\n\n")
kobo_dico(form)
dico <- read.csv(paste("data/dico_",form,".csv",sep = ""), encoding = "UTF-8", na.strings = "")
#rm(form)


# Load data #######################################################################
cat("\n\n\n Load original dataset \n\n\n\n")

## Root table
household <- read.csv("data/evar3_household.csv", sep = ",", encoding = "UTF-8", na.strings = "")
household1 <- household


## linked table to household
child_food_consumed <- read.csv("data/evar3_child_food_consumed.csv", sep = ",", encoding = "UTF-8", na.strings = "")
#nrow(as.data.frame(unique(child_food_consumed$parent_auri)))
names(child_food_consumed)
# "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_grains"
# "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_diary"
# "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_veg"
# "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_meat"
#"child_food_consuption_and_food_sources.child_food_consumed.child_cerelac_consimption"
# "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_nuts"
# "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_vitaA"
# "child_food_consuption_and_food_sources.child_food_consumed.breast_milk"
# "child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_eggs"
# "child_food_consuption_and_food_sources.child_food_consumed.child_milk_consumption"
# "child_food_consuption_and_food_sources.child_food_consumed.child_solid_food_consimption"

child_food_consumed <- merge(x = household1, y = child_food_consumed, by.x = "uri", by.y = "parent_auri", all.y = TRUE)

child_food_consuption.grains <- dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_grains == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.dairy	<- 	dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_diary == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.veg	<- 		dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_veg == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.meat	<- 	dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_meat == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.cerelac <- dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_cerelac_consimption == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.nuts 	<- 	dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_nuts == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.vitaA	<- 	dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_vitaA == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.breast	<-		dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.breast_milk == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.eggs 	<-		dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_foods_consumed_eggs == "yes" ))[ , c("TRUE", "meta_instance_id")]
child_food_consuption.milk	<-		dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_milk_consumption == "yes" ))[ , c("FALSE", "meta_instance_id")]
child_food_consuption.solid	<-		dcast(child_food_consumed, meta_instance_id ~ (child_food_consuption_and_food_sources.child_food_consumed.child_solid_food_consimption == "yes" ))[ , c("FALSE", "meta_instance_id")]

names(child_food_consuption.grains )[1] <- "child_food_consuption.grains"
names(child_food_consuption.dairy)[1] <- "child_food_consuption.dairy"
names(child_food_consuption.veg)[1] <- "child_food_consuption.veg"
names(child_food_consuption.meat)[1] <- "child_food_consuption.meat"
names(child_food_consuption.cerelac)[1] <- "child_food_consuption.cerelac"
names(child_food_consuption.nuts )[1] <- "child_food_consuption.nuts"
names(child_food_consuption.vitaA)[1] <- "child_food_consuption.vitaA"
names(child_food_consuption.breast)[1] <- "child_food_consuption.breast"
names(child_food_consuption.eggs )[1] <- "child_food_consuption.eggs"
names(child_food_consuption.milk)[1] <- "child_food_consuption.milk"
names(child_food_consuption.solid)[1] <- "child_food_consuption.solid"


household <- merge(x = household , y = child_food_consuption.grains , by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.dairy, by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.veg, by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.meat, by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.cerelac, by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.nuts , by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.vitaA, by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.breast, by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.eggs , by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.milk, by = "meta_instance_id", all.x = TRUE)
household <- merge(x = household , y = child_food_consuption.solid, by = "meta_instance_id", all.x = TRUE)

rm(child_food_consumed,
   child_food_consuption.grains,
   child_food_consuption.dairy,
   child_food_consuption.veg,
   child_food_consuption.meat,
   child_food_consuption.cerelac,
   child_food_consuption.nuts ,
   child_food_consuption.vitaA,
   child_food_consuption.breast,
   child_food_consuption.eggs ,
   child_food_consuption.milk,
   child_food_consuption.solid
)


### Food Consumption ####
food_consumption <- read.csv("data/evar3_food_consumption.csv", sep = ",", encoding = "UTF-8", na.strings = "")
#names(food_consumption)
#  "food_consuption_and_food_sources.food_consumption.food_consumed"
# "food_consuption_and_food_sources.food_consumption.food_source"
# "food_consuption_and_food_sources.food_consumption.food_counsumption_pattern"

## checking some potential duplicate the same food item recorded 2 times for the same household
food_consumption$dup <- duplicated(food_consumption[ , c("uri","food_consuption_and_food_sources.food_consumption.food_consumed")])
food_consumption <- food_consumption[ food_consumption$dup == "FALSE", ]

food_consumption <- merge(x = household1, y = food_consumption, by.x = "uri", by.y = "parent_auri", all.y = TRUE)
## Will build 2 frame - one for source / one for pattern
### food source
household.foodsource <- dcast(food_consumption,
                                meta_instance_id ~ food_consuption_and_food_sources.food_consumption.food_consumed ,
                                value.var =   "food_consuption_and_food_sources.food_consumption.food_source",
                                fun.aggregate = mean)
## put NaN as zero
household.foodsource[is.nan(household.foodsource)] <- 0
## Convert to integer
for (i in 2:ncol(household.foodsource)) {household.foodsource[ ,i] <- as.integer(household.foodsource[, i] )
names(household.foodsource)[i] <- paste( "source", names(household.foodsource)[i], sep = "")}
household <- merge(x = household , y = household.foodsource, by = "meta_instance_id", all.x = TRUE)

### food pattern
## amazingly this categoric variable was enconding as an integer... sighh...
#food_consumption$food_consuption_and_food_sources.food_consumption.food_counsumption_pattern <- as.character(food_consumption$food_consuption_and_food_sources.food_consumption.food_counsumption_pattern)

household.foodpattern <- dcast(food_consumption,
                              meta_instance_id ~ food_consuption_and_food_sources.food_consumption.food_consumed ,
                              value.var =   "food_consuption_and_food_sources.food_consumption.food_counsumption_pattern",
                              fun.aggregate = mean )
## put NaN as zero
household.foodpattern[is.nan(household.foodpattern)] <- 0
## Convert to integer
for (i in 2:ncol(household.foodpattern)) {household.foodpattern[ ,i] <- as.integer(household.foodpattern[, i] )
names(household.foodpattern)[i] <- paste( "pattern", names(household.foodpattern)[i], sep = "")}
household <- merge(x = household , y = household.foodpattern, by = "meta_instance_id", all.x = TRUE)

rm(food_consumption, household.foodpattern, household.foodsource)


immigration <- read.csv("data/evar3_immigration.csv", sep = ",", encoding = "UTF-8", na.strings = "")
names(immigration)
# "household_coping_strategy.immigration.immigration_pattern"
# "household_coping_strategy.immigration.immigration_mechanism"

## check duplicate
immigration$dup <- duplicated(immigration[ , c("uri","household_coping_strategy.immigration.immigration_mechanism")])
immigration <- immigration[ immigration$dup == "FALSE", ]

immigration <- merge(x = household1, y = immigration, by.x = "uri", by.y = "parent_auri", all.y = TRUE)
### merging with household
household.immigration <- reshape(immigration[ , c("household_coping_strategy.immigration.immigration_pattern",
                                                  "meta_instance_id",
                                                  "household_coping_strategy.immigration.immigration_mechanism" )],
                                 direction = "wide",
                                 v.names = "household_coping_strategy.immigration.immigration_pattern",
                                 idvar = "meta_instance_id",
                                 timevar = "household_coping_strategy.immigration.immigration_mechanism" )

household <- merge(x = household , y = household.immigration, by = "meta_instance_id", all.x = TRUE)

rm(household.immigration, immigration)


### Income assistance
source_of_income_assistance_1 <- read.csv("data/evar3_source_of_income_assistance_1.csv", sep = ",", encoding = "UTF-8", na.strings = "")

names(source_of_income_assistance_1)
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.source_of_income_assistance"
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.amount_of_income"
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.assistance_period"

## check duplicate
source_of_income_assistance_1$dup <- duplicated(source_of_income_assistance_1[ , c("uri","main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.source_of_income_assistance")])
source_of_income_assistance_1 <- source_of_income_assistance_1[ source_of_income_assistance_1$dup == "FALSE", ]

source_of_income_assistance_1 <- merge(x = household1, y = source_of_income_assistance_1, by.x = "uri", by.y = "parent_auri", all.y = TRUE)

### merging with household
household.assistance.period <- reshape(source_of_income_assistance_1[ , c(
                                                  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.assistance_period",
                                                  "meta_instance_id",
                                                  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.source_of_income_assistance" )],
                                 direction = "wide",
                                 v.names = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.assistance_period",
                                 idvar = "meta_instance_id",
                                 timevar = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.source_of_income_assistance" )

household <- merge(x = household , y = household.assistance.period, by = "meta_instance_id", all.x = TRUE)


### merging with household
household.assistance.income <- reshape(source_of_income_assistance_1[ , c(
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.amount_of_income",
  "meta_instance_id",
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.source_of_income_assistance" )],
  direction = "wide",
  v.names = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.amount_of_income",
  idvar = "meta_instance_id",
  timevar = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.source_of_income_assistance" )
household.assistance.income[is.na(household.assistance.income)] <- 0
household <- merge(x = household , y = household.assistance.income, by = "meta_instance_id", all.x = TRUE)

rm(household.assistance.income, household.assistance.period, source_of_income_assistance_1)

##### Income external ###
source_of_income_external_4 <- read.csv("data/evar3_source_of_income_external_4.csv", sep = ",", encoding = "UTF-8", na.strings = "")

names(source_of_income_external_4)
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_transfer"
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.source_of_income_reittances"
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source"
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.assistance_period"
# "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.remittances_frequency_regular"


## check duplicate
source_of_income_external_4$dup <- duplicated(source_of_income_external_4[ , c("uri","main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source")])
source_of_income_external_4 <- source_of_income_external_4[ source_of_income_external_4$dup == "FALSE", ]

source_of_income_external_4 <- merge(x = household1, y = source_of_income_external_4, by.x = "uri", by.y = "parent_auri", all.y = TRUE)

### merging with household
household.incomexternal.type <- reshape(source_of_income_external_4[ , c(
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_transfer",
  "meta_instance_id",
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )],
  direction = "wide",
  v.names = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_transfer",
  idvar = "meta_instance_id",
  timevar = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )

household <- merge(x = household , y = household.incomexternal.type , by = "meta_instance_id", all.x = TRUE)

household.incomexternal.remittance <- reshape(source_of_income_external_4[ , c(
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.source_of_income_reittances",
  "meta_instance_id",
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )],
  direction = "wide",
  v.names = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.source_of_income_reittances",
  idvar = "meta_instance_id",
  timevar = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )
household.incomexternal.remittance[is.na(household.incomexternal.remittance)] <- 0
household <- merge(x = household , y = household.incomexternal.remittance , by = "meta_instance_id", all.x = TRUE)

household.incomexternal.period <- reshape(source_of_income_external_4[ , c(
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.assistance_period",
  "meta_instance_id",
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )],
  direction = "wide",
  v.names = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_assistance_1.assistance_period",
  idvar = "meta_instance_id",
  timevar = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )

household <- merge(x = household , y = household.incomexternal.period , by = "meta_instance_id", all.x = TRUE)

household.incomexternal.freq <- reshape(source_of_income_external_4[ , c(
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.remittances_frequency_regular",
  "meta_instance_id",
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )],
  direction = "wide",
  v.names = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.remittances_frequency_regular",
  idvar = "meta_instance_id",
  timevar = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_external_4.type_of_external_source" )

household <- merge(x = household , y = household.incomexternal.freq , by = "meta_instance_id", all.x = TRUE)
rm(household.incomexternal.freq, household.incomexternal.period, household.incomexternal.remittance, household.incomexternal.type, source_of_income_external_4)




## strategies_for_long_term #######
strategies_for_long_term <- read.csv("data/evar3_strategies_for_long_term.csv", sep = ",", encoding = "UTF-8", na.strings = "")
names(strategies_for_long_term )
# "household_coping_strategy.strategies_for_long_term.strategy_for_long_term_item"
# "household_coping_strategy.strategies_for_long_term.yearly_coping_pattern"

## check duplicate
strategies_for_long_term$dup <- duplicated(strategies_for_long_term[ , c("uri","household_coping_strategy.strategies_for_long_term.strategy_for_long_term_item")])
strategies_for_long_term  <- strategies_for_long_term[strategies_for_long_term$dup == "FALSE", ]
strategies_for_long_term <- merge(x = household1, y = strategies_for_long_term, by.x = "uri", by.y = "parent_auri", all.y = TRUE)

### merging with household
household.stratlong <- reshape(strategies_for_long_term[ , c(
  "household_coping_strategy.strategies_for_long_term.yearly_coping_pattern",
  "meta_instance_id",
  "household_coping_strategy.strategies_for_long_term.strategy_for_long_term_item" )],
  direction = "wide",
  v.names = "household_coping_strategy.strategies_for_long_term.yearly_coping_pattern",
  idvar = "meta_instance_id",
  timevar = "household_coping_strategy.strategies_for_long_term.strategy_for_long_term_item" )

household <- merge(x = household , y = household.stratlong , by = "meta_instance_id", all.x = TRUE)
rm(household.stratlong, strategies_for_long_term)



## strategies_to_cope_with_a_lack_of_food ##
strategies_to_cope_with_a_lack_of_food <- read.csv("data/evar3_strategies_to_cope_with_a_lack_of_food.csv", sep = ",", encoding = "UTF-8", na.strings = "")
names(strategies_to_cope_with_a_lack_of_food)
# "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_pattern"
# "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_strategy"

## check duplicate
strategies_to_cope_with_a_lack_of_food$dup <- duplicated(strategies_to_cope_with_a_lack_of_food[ , c("uri","household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_strategy")])
strategies_to_cope_with_a_lack_of_food <- strategies_to_cope_with_a_lack_of_food[ strategies_to_cope_with_a_lack_of_food$dup == "FALSE", ]

strategies_to_cope_with_a_lack_of_food <- merge(x = household1, y = strategies_to_cope_with_a_lack_of_food, by.x = "uri", by.y = "parent_auri", all.y = TRUE)

### merging with household
household.stratfood <- reshape(strategies_to_cope_with_a_lack_of_food[ , c(
  "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_pattern",
  "meta_instance_id",
  "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_strategy" )],
  direction = "wide",
  v.names = "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_pattern",
  idvar = "meta_instance_id",
  timevar = "household_coping_strategy.strategies_to_cope_with_a_lack_of_food.food_coping_strategy" )

household <- merge(x = household , y = household.stratfood , by = "meta_instance_id", all.x = TRUE)
rm(household.stratfood, strategies_to_cope_with_a_lack_of_food)


strategies_to_meet_basic_needs <- read.csv("data/evar3_strategies_to_meet_basic_needs.csv", sep = ",", encoding = "UTF-8", na.strings = "")
names(strategies_to_meet_basic_needs)
# "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs"
# "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs_used"

## check duplicate
strategies_to_meet_basic_needs$dup <- duplicated(strategies_to_meet_basic_needs[ , c("uri","household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs")])
strategies_to_meet_basic_needs <- strategies_to_meet_basic_needs[ strategies_to_meet_basic_needs$dup == "FALSE", ]
strategies_to_meet_basic_needs <- merge(x = household1, y = strategies_to_meet_basic_needs, by.x = "uri", by.y = "parent_auri", all.y = TRUE)

### merging with household
household.stratbasicneeds <- reshape(strategies_to_meet_basic_needs[ , c(
  "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs_used",
  "meta_instance_id",
  "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs" )],
  direction = "wide",
  v.names = "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs_used",
  idvar = "meta_instance_id",
  timevar = "household_coping_strategy.strategies_to_meet_basic_needs.strategy_to_meet_basic_needs" )

household <- merge(x = household , y = household.stratbasicneeds , by = "meta_instance_id", all.x = TRUE)
rm(household.stratbasicneeds, strategies_to_meet_basic_needs)





### Expenditure #######
expenditures <- read.csv("data/evar3_expenditures.csv", sep = ",", encoding = "UTF-8", na.strings = "")
#names(expenditures)
expenditures <- merge(x = household1, y = expenditures, by.x = "uri", by.y = "parent_auri", all.y = TRUE)

# "main_incomes_expenditures.spent_amount_last_month.expenditures.expenditure_items_value"
# "main_incomes_expenditures.spent_amount_last_month.expenditures.expenditure_items_category"

### merging expenditure to household
household.expenditures <- dcast(expenditures,
                          meta_instance_id ~ main_incomes_expenditures.spent_amount_last_month.expenditures.expenditure_items_category ,
                          value.var =   "main_incomes_expenditures.spent_amount_last_month.expenditures.expenditure_items_value",
                          fun.aggregate = mean)

## put NaN as zero
household.expenditures[is.nan(household.expenditures)] <- 0
## Convert to integer
for (i in 2:ncol(household.expenditures)) {household.expenditures[ ,i] <- as.integer(household.expenditures[, i] )}
household <- merge(x = household , y = household.expenditures, by = "meta_instance_id", all.x = TRUE)
rm(household.expenditures, expenditures)


source_of_income_neg_coping_3 <- read.csv("data/evar3_source_of_income_neg_coping_3.csv", sep = ",", encoding = "UTF-8", na.strings = "")
names(source_of_income_neg_coping_3)
#  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow"
## check duplicate
source_of_income_neg_coping_3$dup <- duplicated(source_of_income_neg_coping_3[ , c("uri","main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow")])
source_of_income_neg_coping_3 <- source_of_income_neg_coping_3[ source_of_income_neg_coping_3$dup == "FALSE", ]
source_of_income_neg_coping_3 <- merge(x = source_of_income_neg_coping_3, by.x = "parent_auri", y = household1, by.y = "uri",  all.x = TRUE)
### merging with household
household.negcoping <- reshape(source_of_income_neg_coping_3[ , c(
  "main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow",
  "meta_instance_id" )],
  direction = "wide",
  #v.names = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow",
  idvar = "meta_instance_id",
  timevar = "main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow" )

household.negcoping <- dcast(source_of_income_neg_coping_3,
                               meta_instance_id ~ main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow)

#household.negcoping <- dcast(source_of_income_neg_coping_3,
#      meta_instance_id ~ main_incomes_expenditures.amount_of_income_by_source.source_of_income_neg_coping_3.reasons_of_borrow  )
household <- merge(x = household , y = household.negcoping , by = "meta_instance_id", all.x = TRUE)

rm(household.negcoping, source_of_income_neg_coping_3)



## Table for individual ####
household_member <- read.csv("data/evar3_household_member.csv", sep = ",", encoding = "UTF-8", na.strings = "")
household_member <- merge(x = household, y = household_member, by.x = "uri", by.y = "parent_auri", all.y = TRUE)
write.csv(names(household_member), "out/chename.csv")
names(household_member)[1] <- "uriy"

source_of_income_work_2 <- read.csv("data/evar3_source_of_income_work_2.csv", sep = ",", encoding = "UTF-8", na.strings = "")
#names(source_of_income_work_2)
#names(household_member)
#check <- as.data.frame(household_member[ ,c("uri")])
source_of_income_work_2 <- merge(x = source_of_income_work_2, by.x = "parent_auri", y = household_member ,  by.y = "uri", all.x = TRUE)


### merging income to household
household.income <- dcast(source_of_income_work_2,
                          meta_instance_id ~ household.household_member.source_of_income_work_2.source_of_income_work ,
                          value.var =   "household.household_member.source_of_income_work_2.amount_of_income",
                          fun.aggregate = mean)

## put NaN as zero
household.income[is.nan(household.income)] <- 0
## Convert to integer
for (i in 2:ncol(household.income)) {household.income[ ,i] <- as.integer(household.income[, i] )}
household <- merge(x = household , y = household.income, by = "meta_instance_id", all.x = TRUE)
rm(household.income)

## merging income to members ####
member.income <- dcast(source_of_income_work_2,
                       parent_auri ~ household.household_member.source_of_income_work_2.source_of_income_work ,
                          value.var =   "household.household_member.source_of_income_work_2.amount_of_income",
                          fun.aggregate = mean)

## put NaN as zero
member.income[is.nan(member.income)] <- 0
## Convert to integer
for (i in 2:ncol(member.income)) {member.income[ ,i] <- as.integer(member.income[, i] )
names(member.income)[i] <- paste( "household.household_member", names(member.income)[i], sep = ".")
# rename to household.household_member.
}
household_member <- merge(x = household_member ,  by.x = "uri", y = member.income, by.y = "parent_auri",  all.x = TRUE)

rm(member.income, source_of_income_work_2)






## Clean variable if any ##########################################################
cat("\n\n\n Clean variable if any \n\n\n\n")
#household <- kobo_clean(household, dico)

## Build anonymised version of the frame ##########################################
cat("\n\n\n Anonymise Household \n\n\n\n")
#kobo_anonymise(household, dico)

## Save preliminary version before encoding or adding indicators ##################
cat("\n\nWrite backup before encoding or indicators calculation..\n")
write.csv(household,"data/household.csv", row.names = FALSE, na = "")
write.csv(household_member,"data/household_member.csv", row.names = FALSE, na = "")

## Compute indicators if defined ##################################################
#source("code/2-create-indicators.R")

## Compile total expenditure and income
household$totalexpenditure <- household$TE1 + household$TE2 + household$TE3 + household$TE4 +
  household$TE5 + household$TE6 + household$TE7 + household$TE8 + household$TE9 + household$TE10 +
  household$TE11 + household$TE12 + household$TE13 + household$TE14
histogram(household$totalexpenditure)

household$totalincome <- household$work_income_1 + household$work_income_2 + household$work_income_3 +
  household$work_income_4 + household$work_income_5 + household$work_income_6

household$expenditurecapita <- household$totalincome / household$general_information.number_of_household_members

household$incomecapita <- household$totalexpenditure / household$general_information.number_of_household_members

## Compile MEB ######
household$incomecapita[is.nan(household$incomecapita)] <- 0
household$expenditurecapita[is.nan(household$expenditurecapita)] <- 0

histogram(household$general_information.number_of_household_members)

household$meb.income.nfi.food <- "Above.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members == 1 & household$incomecapita <= 1096.25)] <- "Below.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members == 2 & household$incomecapita <= 1026.25)] <- "Below.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members == 3 & household$incomecapita <= 902.91)] <- "Below.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members == 4 & household$incomecapita <= 795.75)] <- "Below.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members == 5 & household$incomecapita <= 783.75)] <- "Below.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members == 6 & household$incomecapita <= 742.416)] <- "Below.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members == 7 & household$incomecapita <= 712.89)] <- "Below.MEB"
household$meb.income.nfi.food[(household$general_information.number_of_household_members >= 8 & household$incomecapita <= 717.5)] <- "Below.MEB"

household$meb.income.nfi <- "Above.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members == 1 & household$incomecapita <= 696.25)] <- "Below.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members == 2 & household$incomecapita <= 626.25)] <- "Below.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members == 3 & household$incomecapita <= 502.9)] <- "Below.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members == 4 & household$incomecapita <= 395.75)] <- "Below.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members == 5 & household$incomecapita <= 383.75)] <- "Below.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members == 6 & household$incomecapita <= 342.4)] <- "Below.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members == 7 & household$incomecapita <= 312.89)] <- "Below.MEB"
household$meb.income.nfi[(household$general_information.number_of_household_members >= 8 & household$incomecapita <= 317.5)] <- "Below.MEB"


household$meb.expenditure.nfi.food <- "Above.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members == 1 & household$expenditurecapita <= 1096.25)] <- "Below.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members == 2 & household$expenditurecapita <= 1026.25)] <- "Below.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members == 3 & household$expenditurecapita <= 902.91)] <- "Below.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members == 4 & household$expenditurecapita <= 795.75)] <- "Below.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members == 5 & household$expenditurecapita <= 783.75)] <- "Below.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members == 6 & household$expenditurecapita <= 742.416)] <- "Below.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members == 7 & household$expenditurecapita <= 712.89)] <- "Below.MEB"
household$meb.expenditure.nfi.food[(household$general_information.number_of_household_members >= 8 & household$expenditurecapita <= 717.5)] <- "Below.MEB"

household$meb.expenditure.nfi <- "Above.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members == 1 & household$expenditurecapita <= 696.25)] <- "Below.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members == 2 & household$expenditurecapita <= 626.25)] <- "Below.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members == 3 & household$expenditurecapita <= 502.9)] <- "Below.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members == 4 & household$expenditurecapita <= 395.75)] <- "Below.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members == 5 & household$expenditurecapita <= 383.75)] <- "Below.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members == 6 & household$expenditurecapita <= 342.4)] <- "Below.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members == 7 & household$expenditurecapita <= 312.89)] <- "Below.MEB"
household$meb.expenditure.nfi[(household$general_information.number_of_household_members >= 8 & household$expenditurecapita <= 317.5)] <- "Below.MEB"





## Re-encoding data now based on the dictionnary -- ##############################
## the xlsform dictionnary can be adjusted this script re-runned till satisfaction
cat("\n\n\n Now  re-encode data  \n\n\n\n")
household <- kobo_encode(household, dico)
household_member <- kobo_encode(household_member, dico)


## Cheking the labels matching... #################################################
## household is the default root data componnents to be used -- in order to deal with nested dataset
cat("\n\n\n Now  labeling variables \n\n\n\n")
household <- kobo_label(household, dico)
household_member <- kobo_label(household_member, dico)

## We now save a back up in the data folder to be used for the Rmd  ###############
cat("\n\nWrite backup ready for report generation \n")
write.csv(household,"data/data2.csv", row.names = FALSE, na = "")
write.csv(household_member,"data/household_member2.csv", row.names = FALSE, na = "")

