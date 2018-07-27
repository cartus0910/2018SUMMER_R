setwd("D:/2018.07 R_DataAnalysis/2018SUMMER_R/data")

ptgs.course <- read.csv("student-por.csv")
math.course <- read.csv("student-mat.csv")

data.source <- merge(ptgs.course,math.course,by=c("school","sex","age","address","famsize","Pstatus",
                                                  "Medu","Fedu","Mjob","Fjob","reason","nursery","internet",
                                                  "guardian","guardian","traveltime","studytime","failures",
                                                  "schoolsup","famsup","activities","higher","romantic",
                                                  "famrel","freetime","goout","Dalc","Walc","health","absences"))
head(data.source)
summary(data.source)

data.source$mathgrades <- rowMeans(cbind(data.source$G1.x,data.source$G2.x,data.source$G3.x))
data.source$portgrades <- rowMeans(cbind(data.source$G1.y,data.source$G2.y,data.source$G3.y))
data.source$alcohol <- data.source$Dalc + data.source$Walc

library(plyr)
data.source$Dalc <- as.factor(data.source$Dalc)      
data.source$Dalc <- mapvalues(data.source$Dalc, 
                              from = 1:5, 
                              to = c("Very Low", "Low", "Medium", "High", "Very High"))
data.source$Walc <- as.factor(data.source$Walc)      
data.source$Walc <- mapvalues(data.source$Walc, 
                              from = 1:5, 
                              to = c("Very Low", "Low", "Medium", "High", "Very High"))
data.source$alcohol <- as.factor(data.source$alcohol)
data.source$alc <- mapvalues(data.source$alcohol, 
                             from = 2:8,
                             to = c("no","yes","yes","yes","yes","yes","yes"))


library(ggplot2)
str1=ggplot(data.source, aes(x=mathgrades, y=portgrades)) +
  geom_point(aes(colour=factor(Dalc)))+ scale_colour_hue(l=25,c=150)+
  geom_smooth(method = "lm", se = FALSE)
str2=ggplot(data.source, aes(x=mathgrades, y=portgrades))+
  geom_point(aes(colour=factor(Walc)))+ scale_colour_hue(l=25,c=150)+
  geom_smooth(method = "lm", se = FALSE)
library(gridExtra)
grid.arrange(str1,str2,nrow=2)
r.sqr <- lm(mathgrades ~ portgrades, data=data.source)
summary(r.sqr)$r.squared 

library(dplyr)
new.source <-rbind(math.course, ptgs.course) #combine the two datasets
# and eliminate the repeats:
apply.source <- new.source %>% distinct(school,sex,age,address,famsize,Pstatus,Medu,Fedu,Mjob,Fjob,reason,
                                        guardian,traveltime,studytime,failures,schoolsup,
                                        famsup,activities,nursery,higher,internet,romantic,
                                        famrel,freetime,goout,Dalc,Walc,health,absences, .keep_all = TRUE)
apply.source$avggrades <- rowMeans(cbind(apply.source$G1,apply.source$G2,apply.source$G3))
apply.source$alcohol <- apply.source$Dalc + apply.source$Walc
apply.source$alcohol <- as.factor(apply.source$alcohol)
apply.source$alc <- mapvalues(apply.source$alcohol, 
                              from = 2:10,
                              to = c("no","yes","yes","yes","yes","yes","yes","yes","yes"))
head(apply.source)

t.test(avggrades ~ alc, data=apply.source)






