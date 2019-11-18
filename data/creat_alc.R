#Mounir Ould Setti 18.11.19
#Data wrangling for exercise 3: Logistic regression
#Data source: UCI Machine Learning Repository Student Performance Data https://archive.ics.uci.edu/ml/datasets/Student+Performance

#3#Importing the data
mat<-read.csv("data/student-mat.csv", header = TRUE, sep = ";")
por<-read.csv("data/student-por.csv", header = TRUE, sep = ";")

##exploring the structure and dimensions of the data
str(mat)
dim(mat)

str(por)
dim(por)

#4#Joining the two datasets
library(dplyr)
join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

##joining the two datasets by the selected identifiers and leaving only rows present in both datasets
math_por <- inner_join(mat, por, by = join_by,suffix=c(".math",".por"))

str(math_por)
dim(math_por)

#5#Combining the duplicated answers
math <- mat

alc <- select(math_por, one_of(join_by))

## the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

## print out the columns not used for joining
notjoined_columns

## for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
}

##Checking that everything is alright
glimpse(alc)

#6#Creating new columns 'alc_use' and 'high_use'
##combining weekday and weekend alcohol use -> alc_use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)
##defining 'high_use' from 'alc_use'
alc <- mutate(alc, high_use = alc_use > 2)

#7#Checking the data and saving it
glimpse(alc)
dim(alc)
write.csv(alc,"data/alc.csv")