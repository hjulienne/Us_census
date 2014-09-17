
#a subset of features that appeared important in the first random forest

features.2 <- c("age", "education","major_industry_code", "major_occupation_code","sex" , "capital_gains", "dividends_from_stocks")

formula <- write_formula(features.2)
#data_learn$income <- as.factor(data_learn$income)
LR <-glm(formula = formula, family = "binomial", data = data_learn)

pred.inc <- as.factor(ifelse(0.5 > predict(LR, data_test,type="response")," - 50000."," 50000+.")
)
#Results
print("Result of classification by logistique regression on the test set")
print(table(obs=data_test$income, pred.inc))

#missclassification rate on test set:
print(sum(obs=data_test$income!=pred.inc)/length(pred.inc))

