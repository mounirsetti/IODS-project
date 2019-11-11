<<<<<<< HEAD
#Mounir Ould Setti 11.11.19 - Analysis part of exercise 2
##1.Importing data and describing it
students2014 <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt",header=TRUE,sep = ",")
str(students2014)
dim(students2014)
head(students2014)
###We have data on 7 variables for 166 students, gender is a factor M/F,
###age and points are intervals, and attitude, deep, stra, and surf are
###numerical scales from 1 to 5
###Points represent the final exam points. Attitude, deep, surface (surf)
###and strategic (stra) represent the wanna be predictors.

##2.Graphical plotting
library(GGally)
library(ggplot2)
#ignore#
#p1<-ggplot(students2014, aes(x = attitude, y = points, col=gender))
#p2<-p1+geom_point()
#p2
#,geom_smooth(method = "lm")
#,ggtitle("Student's attitude versus exam points"))
#pairs(students2014[-1],col=students2014$gender)
#end-ignoring#
ggpairs(students2014, mapping = aes(col=gender, alpha=0.3),
        lower = list(combo = wrap("facethist", bins = 20)))
summary(students2014)
##commenting the results
###It seems that there is a correlation between points and the other measures
###this correlation is particularly strong with attitude
###"It's all about attitude"
###There are more females than males in the study. And it seems that there is
###a difference in measures between genders, but no difference in the exam points.

##3. Regression model
###create a regression model with multiple explanatory variables
studentsmodel<- lm(points ~ attitude + deep + surf, data = students2014)
###print out a summary of the model
summary(studentsmodel)

###comments
####attitude seems to significantly (p<0.1) increase exam points while
####deep and surf don't seem to have enough stat. signif.

###changing parameters
studentsmodel<- lm(points ~ attitude + age + stra, data = students2014)

##4.Summary of the chosen model
###print out a summary of the model
summary(studentsmodel)

####it seems that, along with attitude, age and stra are acceptable predictors
####of exam points (p-values < 0.1)
####these 3 variables explain 22% of the model's variability (multiple R-squared=0.22)

##5.residuals
par(mfrow = c(2,2))
plot(studentsmodel, which = c(1,2,5))

###Residuals seem randomly distributed (good)
###It seems that the model respects the normality assumption.
###Residuals vs leverage: it doesn't seem that there's an outlier biasing the model (good)
=======
#Mounir Ould Setti 11.11.19 - Analysis part of exercise 2
##1.Importing data and describing it
students2014 <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/learning2014.txt",header=TRUE,sep = ",")
str(students2014)
dim(students2014)
head(students2014)
###We have data on 7 variables for 166 students, gender is a factor M/F,
###age and points are intervals, and attitude, deep, stra, and surf are
###numerical scales from 1 to 5
###Points represent the final exam points. Attitude, deep, surface (surf)
###and strategic (stra) represent the wanna be predictors.

##2.Graphical plotting
library(GGally)
library(ggplot2)
#ignore#
#p1<-ggplot(students2014, aes(x = attitude, y = points, col=gender))
#p2<-p1+geom_point()
#p2
#,geom_smooth(method = "lm")
#,ggtitle("Student's attitude versus exam points"))
#pairs(students2014[-1],col=students2014$gender)
#end-ignoring#
ggpairs(students2014, mapping = aes(col=gender, alpha=0.3),
        lower = list(combo = wrap("facethist", bins = 20)))
summary(students2014)
##commenting the results
###It seems that there is a correlation between points and the other measures
###this correlation is particularly strong with attitude
###"It's all about attitude"
###There are more females than males in the study. And it seems that there is
###a difference in measures between genders, but no difference in the exam points.

##3. Regression model
###create a regression model with multiple explanatory variables
studentsmodel<- lm(points ~ attitude + deep + surf, data = students2014)
###print out a summary of the model
summary(studentsmodel)

###comments
####attitude seems to significantly (p<0.1) increase exam points while
####deep and surf don't seem to have enough stat. signif.

###changing parameters
studentsmodel<- lm(points ~ attitude + age + stra, data = students2014)

##4.Summary of the chosen model
###print out a summary of the model
summary(studentsmodel)

####it seems that, along with attitude, age and stra are acceptable predictors
####of exam points (p-values < 0.1)
####these 3 variables explain 22% of the model's variability (multiple R-squared=0.22)
>>>>>>> 57551969939d163ba4edf84eed7d3cedcb8d11f4
