#Data Wrangling Week 6
#Mounir Ould Setti
#09/12/2019

library(dplyr)
library(tidyr)

#1. Loading the datasets and checking them
## Read the BPRS data
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)

## read the RATS data
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", header = TRUE, sep = '\t')

##Checking the data
names(BPRS)
names(RATS)

summary(BPRS)
summary(RATS)

glimpse(BPRS)
glimpse(RATS)

str(BPRS)
str(RATS)

##Both datasets are organized in a wide form, meaning that observations at different
##time points are recorded into time-point-columns. In wide forms of data there are
##many columns and a number of rows equal to n (number of subjects)

#2. Converting categ variables to factors

BPRS$treatment <- as.factor(BPRS$treatment)
BPRS$subject <- as.factor(BPRS$subject)

RATS$ID <- as.factor(RATS$ID)
RATS$Group <- as.factor(RATS$Group)

#3. Converting the datasets into long form and adding a week and a time variable

BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(BPRSL$weeks,5,5)))

RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 

#4. Looking again at the data sets

names(BPRSL)
names(RATSL)

summary(BPRSL)
summary(RATSL)

glimpse(BPRSL)
glimpse(RATSL)

str(BPRSL)
str(RATSL)

dim(BPRSL)
dim(RATSL)

##The long dataset form has more rows and less columns. A subject can have many
##rows represeting his observations at different time points which are indicated
##in the time/week column 

##Writing CSVs
write.csv(BPRSL,"data/BPRSL.csv")
write.csv(RATSL,"data/RATSL.csv")

