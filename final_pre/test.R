setwd("D:/2018.07 R_DataAnalysis/2018SUMMER_R/data")

library("sf")
library("ggplot2")
worldmap <- st_read("countries.shp",stringsAsFactors=FALSE,quiet=TRUE)
names(worldmap)[1] <- paste('Country.Name')
worldmap <- st_transform(worldmap, "+init=esri:54030")

raw_gender <- read.csv('Gender_wewant.csv')
test_gender <- read.csv('gender_test.csv')
names(test_gender)[1] <- paste('Country.Name')
test_map <- merge(worldmap, test_gender, by="Country.Name")

test_map$X2016..YR2016. <- suppressWarnings(as.numeric(
  levels(test_map$X2016..YR2016.))[test_map$X2016..YR2016.])

ggplot() +
  geom_sf(data=test_map, aes(fill=X2016..YR2016.)) +
  geopoint