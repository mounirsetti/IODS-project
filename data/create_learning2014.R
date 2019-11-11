#Mounir Ould Setti 11.11.2019 Data wrangling - Exercise 2 (linear and multiple regression)

##Importing the data
learning2014 <- read.csv("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt",header=TRUE,sep = "\t")
str(learning2014)
dim(learning2014)
#data has 60 variables. Many seem to be questions that are measuring one variable/score

library('dplyr')
##stacking variables and generating the analysis dataset
### questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

### select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(learning2014, one_of(deep_questions))
learning2014$deep <- rowMeans(deep_columns)

### select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(learning2014, one_of(surface_questions))
learning2014$surf <- rowMeans(surface_columns)

### select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(learning2014,one_of(strategic_questions))
learning2014$stra <- rowMeans(strategic_columns)

###Creating a clean analysis dataset
learnlysis <- select(learning2014,one_of(c("gender","Age","Attitude", "deep", "stra", "surf", "Points")))
colnames(learnlysis)[2] <- "age"
colnames(learnlysis)[3] <- "attitude"
colnames(learnlysis)[7] <- "points"

###Excluding variables with exam points = 0
learnlysis <- filter(learnlysis,points>0)

##writing the analysis dataset into csv
write.table(learnlysis,file="data/learning2014.txt",sep="\t")
###checking how it is read
testread <- read.csv("data/learning2014.txt",header=TRUE,sep = "\t")
str(testread)
head(testread)