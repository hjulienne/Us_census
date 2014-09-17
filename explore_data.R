#Create representation of all variables

pdf("./plots/explore_plot.pdf", width=12, height=12)
par(mfrow=c(2,2))

# We represent the distribution of continuous features by an histogram
continuous <- c("age", "wage_per_hour", "capital_gains", "capital_losses", "dividends_from_stocks", "weeks_worked_in_year") 
categorical <- setdiff(names(data_learn), continuous)
N <- length(data_learn[,1])
par(mar=c(5,4,4,2))
for( f in continuous)
{
hist(data_learn[,f], main= paste("Histogram of", f), col="grey", xlab=f)
}

# we represent categorical data by bar plots of frequencies
par(mar=c(4,15,4,2), las=2)
for( f in categorical)
{

barplot(table(data_learn[,f])/N, main= paste(f), horiz=TRUE)
}

dev.off() # closing graphical file