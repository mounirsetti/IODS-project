#Mounir Ould Setti 02.12.2019 Chapter 5: Dimensionality reduction techniques

library(tidyr)
library(dplyr)
library(stringr)
library(corrplot)
library(GGally)
library(ggplot2)

#0- Loading and exploring 'human' dataset
human<-read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt",header=TRUE,sep=",")

str(human)
summary(human)
dim(human)
gather(human) %>% ggplot(aes(value)) + facet_wrap("key", scales = "free") + geom_bar()
##The data is composed of 195 observations and 19 variables.
##Beside HDI.rank, and country, all the factors are numeric.
##Data has some outliers and NA values.
##Data contains measures of factors contributing in the constitution of the
##Human Development Index and the Gender Inequality Index in the United Nations 195 countries.
##More information on the data can be found here http://hdr.undp.org/en/content/human-development-index-hdi

#1- Transforming GNI to numeric
str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric -> human$GNI

#2- Exluding unneeded variables
human <- select(human, one_of(c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")))

#3- Remove all rows with missing values
human <- filter(human, complete.cases(human)==TRUE)

#4- Remove observations relating to regions instead of countries (the 7 last observations)
human <- human[1:(nrow(human) - 7), ]

#5- Defining row names by country names and saving the data
rownames(human) <- human$Country
human <- select(human, -Country)
write.csv(human,"data/human.csv")
