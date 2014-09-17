#Easy to interpretate decision tree

library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)

features.2 <- c("age", "education","major_industry_code", "major_occupation_code","sex" , "capital_gains", "dividends_from_stocks")

formula <- "income ~ age"
for(f in features.2[-1]){ formula <- paste(formula,"+",f)}

T1 <- rpart(formula,data=data_learn, method="class")
#Saving decision tree
pdf("./plots/decision_tree.pdf")
fancyRpartPlot(T1)
dev.off()

print("Result of classification by the decision tree model")
pred.inc <- predict(T1, data_test, type="class")
#Results
print(table(obs=data_test$income, pred.inc))

#missclassification rate on test set:
print(sum(obs=data_test$income!=pred.inc)/length(pred.inc))