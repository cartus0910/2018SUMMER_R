library(ggmap)
library(mapproj)
map <- get_map(location='Taiwan', zoom=8, maptype='toner-lite')
library(readr)
data1 <- read_csv('Debris_Flow_Station.csv')
ggmap(map) + geom_point(aes(x=data1$Longitude, y=data1$Latitude),
                        data=data1, color='red', size=2)