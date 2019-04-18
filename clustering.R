View(mtcars)
str(mtcars)
mtc<- scale(mtcars);View(mtc)
mtcars_cl<-kmeans(mtc,centers=3,nstart = 10)
mtcars_cl
mtcars_cl$cluster
mtcars_cl$tot.withinss
mtcars_cl$betweenss
mtcars_cl$totss
sum(mtcars_cl$tot.withinss,mtcars_cl$betweenss)
#genrate screeplot
ratio_cars<-c(0,0,0,0,0,0,0);ratio_cars
for (k in 1:7) 
  {
  cars_cl<-kmeans(mtc,k,20)
  ratio_cars[k]<-cars_cl$tot.withinss/cars_cl$totss
}
plot(ratio_cars,type = "b",xlab = "k",ylab = "wss/tss",main="scree plot")

mtcars_cl1<-kmeans(mtc,centers = 6,nstart = 10);mtcars_cl1
mtcars_cl1$cluster
mtc_new<-cbind(mtc,mtcars_cl1$cluster);mtc_new
View(mtc_new)
subset(data.frame(mtc_new,mtcars_cl1$cluster==1))
plot(mtc[,1],mtc[,3],col=mtcars_cl1$cluster)
dunn(clusters = mtcars_cl1$cluster,Data=mtcars)
#hierarichial method
dm<-dist(mtc);dm

hcl_single<-hclust(dm,method = "single");hcl_single
plot(hcl_single)
hcl_cutsingle<-cutree(hcl_single,6);hcl_cutsingle
dunn(clusters = hcl_cutsingle,Data=mtcars)

hcl_complete<-hclust(dm,method = "complete");hcl_complete
plot(hcl_complete)
hcl_cutcomplete<-cutree(hcl_complete,6);hcl_cutcomplete
dunn(clusters = hcl_cutcomplete,Data=mtcars)

hcl_average<-hclust(dm,method = "average");hcl_average
plot(hcl_average)
hcl_cutaverage<-cutree(hcl_average,6);hcl_cutaverage
dunn(clusters = hcl_cutaverage,Data=mtcars)

mt_single<-cbind(mtc,hcl_cutsingle);View(mt_single)
subset(mt_single,hcl_cutsingle==1)


#Case study on cluster analysis
getwd()
setwd("C:/Users/Mohit/Desktop/Nikhil Analytics Material/R Material/R part2 assignments/Cluster Analysis")
crime_data<-read.csv("crime_data case file.csv");View(crime_date)
scale_Data<-scale(crime_data[2:5]);scale_Data
kmeans_applied<-kmeans(scale_Data,centers = 4,nstart = 20)
kmeans_applied
scree<-c(0,0,0,0,0,0,0,0);scree
for (k in 1:8) 
{
  crime<-kmeans(scale_Data,k,20)
  scree[k]<-crime$tot.withinss/crime$totss
}
plot(scree,type = "b",xlab = "k",ylab = "wss/tss",main="scree plot")
abc<-kmeans(scale_Data,centers = 4,nstart = 20);abc
abc$cluster
scale_Data_new<-cbind(scale_Data,abc$cluster);scale_Data_new
View(scale_Data_new)
subset(data.frame(scale_Data_new,abc$cluster==1))
plot(scale_Data[,1],scale_Data[,3],col=abc$cluster)
dunn(clusters = abc$cluster,Data=crime_data)
dm<-dist(scale_Data);dm

crime_single<-hclust(dm,method = "single");crime_single
plot(crime_single)
crime_cutsingle<-cutree(crime_single,4);crime_cutsingle
dunn(clusters = crime_cutsingle,Data=crime_data)

crime_complete<-hclust(dm,method = "complete");crime_complete
plot(crime_complete)
crime_cutcomplete<-cutree(crime_complete,4);crime_cutcomplete
dunn(clusters = crime_cutcomplete,Data=crime_data)

crime_average<-hclust(dm,method = "average");crime_average
plot(crime_average)
crime_cutaverage<-cutree(crime_average,4);crime_cutaverage
dunn(clusters = crime_cutaverage,Data=crime_data)


