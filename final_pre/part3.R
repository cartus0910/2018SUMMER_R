setwd("D:/2018.07 R_DataAnalysis/2018SUMMER_R/data")

library(tidyr)
raw_ath<- read.csv("athlete_events.csv")

library(dplyr)
ath <- raw_ath%>%filter(Year >= 1992)

ath.clean <- data.frame(ath$Sex, ath$NOC, ath$Year, ath$Medal)
ath.clean$male <- 0
ath.clean$female <- 0

for (i in 1:nrow(ath.clean)){
  if (is.na(ath.clean[i,4])){
  }
  else if (ath.clean[i,1] == 'M'){
    ath.clean$male[i] <- 1
  }
  else if (ath.clean[i,1] == 'F'){
    ath.clean$female[i] <- 1
  }
}
ath.clean$ath.Sex <- NULL
ath.clean$ath.Medal <- NULL

ath.group <- ath.clean%>% group_by(ath.NOC, ath.Year)%>% summarise(Msum = sum(male), Fsum = sum(female))
names(ath.group)[1] <- paste("ISO3V10")

ath.select <- ath.group[ath.group$ath.Year == '2012', ]

require (rworldmap)
require(rworldxtra)

ath_map <- joinCountryData2Map(ath.select,
                               joinCode = "ISO3",
                               nameJoinColumn = "ISO3V10")

mapPies(ath_map, nameX="LON", nameY="LAT", nameZs=c('Msum', 'Fsum'),
        zColours = c('#00CDCD','pink'), oceanCol = '#5F9EA0', landCol = 'beige')





