#Mounir Ould Setti 25.11.2019 Chapter 4: Clustering and classification

##2.Importing the data
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

##3.Exploring the dataset
str(hd)
dim(hd)

str(gii)
dim(gii)

summary(hd)
summary(gii)

##4.Renaming the variables
library(dplyr)
colnames(hd)[1] <- "rank.hd"
colnames(hd)[2] <- "country"
colnames(hd)[3] <- "HDI"
colnames(hd)[4] <- "lifexp"
colnames(hd)[5] <- "expecteduc"
colnames(hd)[6] <- "meaneduc"
colnames(hd)[7] <- "GNIcapita"
colnames(hd)[8] <- "GNIrank"

colnames(gii)[1] <- "rank.gii"
colnames(gii)[2] <- "country"
colnames(gii)[3] <- "GII"
colnames(gii)[4] <- "MMR"
colnames(gii)[5] <- "ABR"
colnames(gii)[6] <- "PRP"
colnames(gii)[7] <- "PSE.F"
colnames(gii)[8] <- "PSE.M"
colnames(gii)[9] <- "LFPR.F"
colnames(gii)[10] <- "LFPR.M"

##5.Working the GII data (creating two new ratio variables)
gii <- mutate(gii, PSE.R = (PSE.F/PSE.M))
gii <- mutate(gii, LFPR.R = (LFPR.F/LFPR.M))

##6. Joining HDI dataset with GII dataset and saving it
human <- inner_join(hd, gii)
###head(human)
write.csv(human,"data/human.csv")
