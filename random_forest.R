library("randomForest")

#choosed features to predict the income
# We fit a first model with a lot of features 
# We then do a selection based on the importance 
# of feature for classification in the random forest

features <- c("age", "class_of_worker", "education","wage_per_hour","marital_stat","major_industry_code", "major_occupation_code","race","sex" ,"full_or_part_time_employment_stat", "capital_gains", "capital_losses", "dividends_from_stocks","tax_filer_stat", "region_of_previous_residence","detailed_household_summary_in_household", "family_members_under_18", "country_of_birth_father", "country_of_birth_mother" ,"country_of_birth_self", "citizenship" , "own_business_or_self_employed" ,"veterans_benefits", "weeks_worked_in_year")


formula <- write_formula(features)

set.seed(319)
#data_learn$income <- as.factor(data_learn$income)
RF1 <- randomForest(as.formula(formula), data=data_learn[,c(features,"income")], importance=TRUE, ntree=100, sampsize=1000)
pred.inc <- predict(RF1, data_test)
#Results
print("Result of classification by RF1 on the test set")
print(table(observed=data_test$income, predicted=pred.inc))

#missclassification rate on test set:
print(sum(obs=data_test$income!=pred.inc)/length(pred.inc))

pdf("./plots/RF1_importance.pdf", width=12, height=6)
varImpPlot(RF1)
dev.off()