setwd("D:/2018.07 R_DataAnalysis/2018SUMMER_R/data")

library(sf)
library(ggplot2)
worldmap <- st_read("countries.shp",stringsAsFactors=FALSE,quiet=TRUE)
names(worldmap)[1] <- paste('Country.Name')
worldmap <- st_transform(worldmap, "+init=esri:54030")

raw_gender <- read.csv('Gender_wewant.csv')

df.sepa <- split(raw_gender, with(raw_gender, Series.Name), drop = TRUE)

gender.var <- "Labor force, female (% of total labor force)"

varnum <- which(names(df.sepa)==gender.var)
df.need <- data.frame(df.sepa[varnum])
names(df.need)[2] <- paste('Country.Name')
gender_map <- merge(worldmap, df.need, by="Country.Name")
library(stringr)
for (i in 5:ncol(gender_map)-1){
  names(gender_map)[i] <- str_sub(names(gender_map)[i],-5,-2)
}

year = '2016'

gender_map[year] <- suppressWarnings(as.numeric(
  levels(as.factor(gender_map[[year]]))[gender_map[[year]]]))

ggplot() +
  geom_sf(data=gender_map, aes(fill=gender_map[[year]]))