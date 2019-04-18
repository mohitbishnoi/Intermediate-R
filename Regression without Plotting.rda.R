population1<- c(10.2,  10.4,  10.5,  10.6, 10.8, 10.10,  11.1, 11.3, 11.4, 11.6);population1
years1<-c(2001:2010);years1
lm_function<-lm(population1~years1)
summary(lm_function)
prediction<-data.frame(years1=c(2011:2015))
results<-predict(lm_function,prediction)
print(results)
