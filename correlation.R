x<- c(1,2,3);x
y<-c(3,5,6);y
n<- length(x);n
diff_x<- (x-mean(x));diff_x
diff_y<- (y-mean(y));diff_y
cov_xy<-sum(diff_x*diff_y)/(n-1);cov_xy
cov(x,y)
std_x<-sqrt(sum(diff_x^2)/(n-1));std_x
std_y<-sqrt(sum(diff_y^2)/(n-1));std_y
cor_xy<- cov_xy/(std_x*std_y);cor_xy
cor(x,y)
library(MASS)
str(cats)
View(cats)
cor(cats$Bwt,cats$Hwt)
scatter.smooth(cats$Bwt,cats$Hwt)
plot(cats$Bwt,cats$Hwt)
with(cats,cor(Bwt,Hwt))
with(cats,plot(Bwt,Hwt,main = "correlation b/w Bwt and Hwt",
               xlab = "Body weight in KG",
               ylab = "Heart weight in G"))
with(cats,cor.test(Bwt,Hwt))
cor(cement$x1,cement$y)
cor(cement$x3,cement$y)
cor(cement$x1,cement$x3)
cor(cement)


#
getwd()
setwd("C:/Users/Mohit/Desktop/Nikhil Analytics Material/R Material/R part2 assignments/Case Study Correlation/Case 1")
data1<- read.xlsx("smoking.xlsx",sheetIndex = 1,header = T);
View(data1)
with(data1,cor.test(longetivity))
cor(data1)
