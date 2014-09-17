col_names <- read.table("./us_census_data/col_names.txt")

data_learn <- read.table("us_census_data/census_income_learn.csv", sep=",")
data_test <- read.table("us_census_data/census_income_test.csv", sep=",")
names(data_learn) <- c(as.character(col_names[-25,1]),"income")
names(data_test) <- c(as.character(col_names[-25,1]),"income")

#remove instance weight from dataset
data_learn = data_learn[,names(data_learn)!="instance_weight"]
data_test = data_test[,names(data_test)!="instance_weight"]

#simplify the education feature by grouping together all levels below high school graduate

data_learn$education <- as.character(data_learn$education)
data_learn$education[data_learn$education %in% c(" 10th grade"," 11th grade"," 12th grade no diploma"," 1st 2nd 3rd or 4th grade"," 5th or 6th grade", " 7th and 8th grade"," 9th grade"," Children")] <- "under high school"
data_learn$education <- as.factor(data_learn$education)

data_test$education <- as.character(data_test$education)
data_test$education[data_test$education %in% c(" 10th grade"," 11th grade"," 12th grade no diploma"," 1st 2nd 3rd or 4th grade"," 5th or 6th grade", " 7th and 8th grade"," 9th grade"," Children")] <- "under high school"
data_test$education <- as.factor(data_test$education)

#a small function to write a formula with a lot of features:

write_formula<- function(features)
{
formula <- paste("income ~", features[1])
for(f in features[-1]){ formula <- paste(formula,"+",f)}
return(formula)
}

