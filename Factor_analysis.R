
getwd()
setwd("C:/Users/Mohit/Desktop/Nikhil Analytics Material/R Material/R part2 assignments/Factor Analysis")
EFA<-read.csv("dataset_EFA.csv");View(EFA)
corMat <- cor(EFA);corMat
dataeigen<-eigen(corMat)$values
dataeigen
scree.plot(corMat)
library(mnormt)
library(GPArotation)
library(psych)
solution <- fa(r = corMat, nfactors = 2, rotate = "oblimin", fm = "pa")
solution
fa.diagram(solution)
Newdata<-factor.scores(data,solution)$scores
View(Newdata)

#case study 3
getwd()
setwd("C:/Users/Mohit/Desktop/Nikhil Analytics Material/R Material/R part2 assignments/Case Study for Cluster and Factor Analysis/Case 3")
Interview<-read.xlsx("interview.xlsx",sheetIndex = 1);View(Interview)
cor_Interview <- cor(Interview);cor_Interview
Interview_eigen<-eigen(cor_Interview)$values
Interview_eigen
length(Interview_eigen[Interview_eigen>1])
scree.plot(cor_Interview)
solution <- fa(r = cor_Interview, nfactors = 4, rotate = "oblimin", fm = "pa")
solution
fa.diagram(solution)
random1<-factor.scores(Interview,solution)$scores;random1

View(random1)


#case study 5
getwd()
setwd("C:/Users/Mohit/Desktop/Nikhil Analytics Material/R Material/R part2 assignments/Case Study for Cluster and Factor Analysis/Case 5")
Agri<-read.table("Agri-produce.txt",skip = 16,fill = T);View(Agri)
names(Agri)<-c("Year","Month of year","Series Month","Rainfall","Agri-produce")
cor_Agri <- cor(Agri[1:4]);cor_Agri
Agri_eigen<-eigen(cor_Agri)$values
Agri_eigen
scree.plot(cor_Agri)
length(Agri_eigen[Agri_eigen>1])
solution_Agri <- fa(r = cor_Agri, nfactors = 2, rotate = "oblimin", fm = "pa")
solution_Agri
fa.diagram(solution_Agri)
fs<-factor.scores(Agri[1:4],solution_Agri)$scores;fs

View(random1)



Employment<-read.csv("Employment and wages.csv");View(Employment)
str(Employment)
cor_Emp <- cor(Employment);cor_Emp
Emp_eigen<-eigen(cor_Emp)$values
Emp_eigen
scree.plot(cor_Emp)
length(Emp_eigen[Emp_eigen>1])
solution_Emp <- fa(r = cor_Emp, nfactors = 3, rotate = "oblimin", fm = "pa")
solution_Emp
fa.diagram(solution_Emp)
fs1<-factor.scores(Employment[-9,],solution_Emp)$scores;fs1

View(fs1)
