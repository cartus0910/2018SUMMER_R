setwd("D:/2018.07 R_DataAnalysis/2018SUMMER_R/data")

#import data
library(sf)
library(ggplot2)
worldmap <- st_read("TM_WORLD_BORDERS-0.3.shp",stringsAsFactors=FALSE,quiet=TRUE)
names(worldmap)[3] <- paste('Country.Code')
worldmap <- st_transform(worldmap, "+init=esri:54030")
raw_gender <- read.csv('Gender_wewant.csv')

gender_map <- merge(worldmap, raw_gender, by="Country.Code")

library(stringr)
for (i in 15:ncol(gender_map)-1){
  names(gender_map)[i] <- str_sub(names(gender_map)[i],-5,-2)
  if((i >= 17) == (i < 41)){
    gender_map[i+1] <- (gender_map[[i+1]] + gender_map[[i]] + gender_map[[i-1]] + gender_map[[i-2]]) /4
  }
}

library(tidyr)
ath<- read.csv("athlete_wewant.csv")

x <- gender_map%>%
  filter(Series.Name == 'Adjusted net enrollment rate, primary, female (% of primary school age children)')%>%
  select('2010')

library(dplyr)
#plotting
gender_map%>%
  filter(Series.Name == 'Adjusted net enrollment rate, primary, female (% of primary school age children)')%>%
  select('2010')%>%
  ggplot() +
  geom_sf(aes(fill=`2010`))+
  scale_fill_gradient(low = "#FFE4F3", high = "#F62018")









