# Using text file
getwd()
credit1<- read.table("credit.txt",skip = 3);View(credit1)
Query2<- data.frame(Account = credit1[,1],
                    Name = credit1[,2],
                    Name = credit1[,3],
                    Type = credit1[,4],
                    Transaction = credit1[,5])
Query2
View(Query2)
company<- read.table("company.txt",skip = 3,fill = T);View(company)
company1<- data.frame(Name = paste(gsub(","," ",company$V1),company$V2),
                     Age = company$V3,
                     Sex = company$V4,
                     SSN = company$V5)
View(company1) 

# using CSV file
getwd()
setwd("C:/Users/Mohit/Desktop/Nikhil Analytics Material/R Material/R part2 assignments/Data Extraction")
gmat<- read.csv("gmat.csv"); View(gmat)
gmat1<- read.csv("gmat_1.csv",header = F); View(gmat1)
gmat2<- read.csv("gmat_1.csv",header = F,col.names = c("candidate","Toefl_Score"),skip = 9,nrows = 10)
View(gmat2)
gmat3<- read.csv("gmat.csv",header = F,col.names = c("Std_id","Score"),skip = 6,nrows = 15);View(gmat3)

# Using Excel File
Sales1<- read.xlsx("sales by date.xlsx",sheetIndex = 1,colIndex = 1:2,rowIndex = 3:18,startRow = 3,header = F);View(Sales1)
Alpe<- read.xlsx("Alpe.d.Huez.xls",header = T,sheetName = 1,colIndex = 2,4,8,startRow = 2);View(Alpe)

#Using SAS File
census<- read.sas7bdat("census.sas7bdat");View(census)                
