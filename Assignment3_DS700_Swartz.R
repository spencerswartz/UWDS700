library(arm)
acs_ny <- read.csv("E:/RDatasets/acs_ny.csv")
acs_ny[,"Greater150000"] <- ifelse(acs_ny[,"FamilyIncome"] > 150000,1,0)
model <- glm(formula=acs_ny[,"Greater150000"]~acs_ny[[1]]+acs_ny[[3]]+acs_ny[[4]]+acs_ny[[5]]+acs_ny[[6]]+acs_ny[[7]]+acs_ny[[8]]+acs_ny[[9]]+acs_ny[[10]]+acs_ny[[11]]+acs_ny[[12]]+acs_ny[[13]]+acs_ny[[14]]+acs_ny[[15]]+acs_ny[[16]]+acs_ny[[17]]+acs_ny[[18]],data=acs_ny,family="binomial")
summary(model)
coefplot(model)