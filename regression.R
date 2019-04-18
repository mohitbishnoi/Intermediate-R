getwd()
plot(density(cats$Hwt))
plot(cats$Bwt,cats$Hwt)
cor(cats$Bwt,cats$Hwt)
boxplot(cats$Bwt,cats$Hwt)
boxplot.stats(cats$Hwt)$out
newcats<-cats;str(newcats);str(cats);str(newcats)


newcats2<-newcats[!newcats$Hwt %in% c(17.2,20.5),];
str(newcats2);
View(newcats2)
median(newcats$Hwt)
#replace the outliers of Hwt with median value
newcats[newcats$Hwt %in% c(17.2,20.5),3] = median(newcats$Hwt,na.rm = T);str(newcats)
#perform regression, Interpretation & conclusion
lm_out<- lm(Hwt~Bwt,data = newcats);lm_out
#summery function
summary(lm_out)
#Genrating scatter plot and drawing regression line
with(newcats,plot(Bwt,cats$Hwt,mean= "Bwt vs Hwt",
     xlab = "Body weight in KG",ylab = "Heart weight in grams"))
abline(lm_out,col="green")
#validating model
with(newcats,plot(Bwt,lm_out$residuals,
                  main = "Homoscedasticity,e vs Bwt,",
                  xlab = "Bwt, body weight in Kg",
                  ylab = "error or residual"))
abline(lm(lm_out$residuals~newcats$Bwt),col = "red")
#prediction of new values of Hwt based on new values of Bwt

NewBwt<- data.frame(Bwt = c(2.3,2.34,2.4,2.45,2.5))
pred_Hwt<- predict(lm_out,newdata = NewBwt)
pred_Hwt
#combine values
New_BwtHwt<- cbind(NewBwt,pred_Hwt);View(New_BwtHwt)


#case study regression case1
population<- c(10.2,  10.4,  10.5,  10.6, 10.8, 10.10,  11.1, 11.3, 11.4, 11.6);population
years<-c(2001:2010);years
cor(population,years)
boxplot(years,population)
boxplot.stats(years,population)$out
#newdata<-c(population);str(newdata);str(newdata);str(newdata);View(newdata)
#newdata1<-c(years);str(newdata);str(newdata);str(newdata);View(newdata1)
#fulldata<-cbind(newdata,newdata1);fulldata
#warnings()
lm_out1<-lm(population~years);lm_out1

summary(lm_out1)
plot(years,population,main= "Population vs years",
                  xlab = "Population",ylab = "Years")
abline(lm_out1,col="green")

plot(years,lm_out1$residuals,
                  main = "population vs years",
                  xlab = "population",
                  ylab = "years")
abline(lm(lm_out1$residuals~years),col = "red")

lm_out1$coefficients

newpop1<-data.frame(years=c(2011:2015));newpop1

pred_population<-predict(lm_out1, newdata = newpop1);pred_population

predicted_population_table<-cbind(newpop1,pred_population)
View(predicted_population_table)

#case2
getwd()
setwd("C:/Users/Mohit/Desktop/Nikhil Analytics Material/R Material/R part2 assignments/Case study Regression")
train1<-read.table("TRAIN.txt")
View(train1)
colnames(train1)<-c("week","no_of_cars","miles_per_week","passengers_per_week")

#correlation check between passengers (independent) and no of cars (dependent)
cor(train1$no_of_cars,train1$passengers_per_week)

#Check linear relationship
with(train1, scatter.smooth(no_of_cars,passengers_per_week))

#Outlier detection and treatment
boxplot(train1$no_of_cars,train1$passengers_per_week)
boxplot.stats(train1$passengers_per_week)$out

#No Outliers

#Performing linear regrssion

lm_out1<-lm(passengers_per_week~no_of_cars, data=train1);lm_out1
summary(lm_out1)

#Generating scatter plot and Drawing regression line1
plot(train1$no_of_cars,train1$passengers_per_week, xlab="no of cars per week", ylab="no of passengers")
abline(lm_out1, col="red")

#Validate the Model, checking homodescasicity

plot(train1$no_of_cars, lm_out1$residuals, xlab="no of cars per week", ylab="residuals or error")
abline(lm(lm_out1$residuals~train1$no_of_cars), col="red")


#Making Predictions

lm_out1$coefficients
