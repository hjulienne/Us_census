library("randomForest")

#a subset of features that appeared important in the first random forest

features.2 <- c("age", "education","major_industry_code", "major_occupation_code","sex" , "capital_gains", "dividends_from_stocks")

formula <- write_formula(features.2)
set.seed(220)
#data_learn$income <- as.factor(data_learn$income)
RF2 <- randomForest(as.formula(formula), data=data_learn[,c(features,"income")], importance=TRUE, ntree=500, sampsize=1000)
pred.inc <- predict(RF2, data_test)
#Results
print("Result of classification by RF2 on the test set")
print(table(obs=data_test$income, pred.inc))

#missclassification rate on test set:
print(sum(obs=data_test$income!=pred.inc)/length(pred.inc))