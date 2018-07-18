setwd('D:/2018.07 R_DataAnalysis/2018SUMMER_R/data')

library(readr)
DN <- read_csv("Disaster_NewTaipei.csv")
DNH <- read_csv("Disaster_NewTaipei_Help.csv")

DN$occurrence_time <- substring(as.character(DN$occurrence_time),1,6)
DN$weighted <- as.numeric(as.character(unlist(5*DN[5]+2*DN[6]+2*DN[7]+4*DN[8])))


season <- c(' 全年', ' 第一季', ' 第二季', ' 第三季', ' 第四季')
s_month <- c('.01', '.01', '.04', '.07', '.10')
e_month <- c('.12', '.03', '.06', '.09', '.12')

DNH$startmonth <- gsub(season[1], s_month[1], as.character(DNH$期間))
DNH$startmonth <- gsub(season[2], s_month[2], as.character(DNH$startmonth))
DNH$startmonth <- gsub(season[3], s_month[3], as.character(DNH$startmonth))
DNH$startmonth <- gsub(season[4], s_month[4], as.character(DNH$startmonth))
DNH$startmonth <- gsub(season[5], s_month[5], as.character(DNH$startmonth))
DNH$startmonth <- as.numeric(DNH$startmonth) - 1911

DNH$endmonth <- gsub(season[1], e_month[1], as.character(DNH$期間))
DNH$endmonth <- gsub(season[2], e_month[2], as.character(DNH$endmonth))
DNH$endmonth <- gsub(season[3], e_month[3], as.character(DNH$endmonth))
DNH$endmonth <- gsub(season[4], e_month[4], as.character(DNH$endmonth))
DNH$endmonth <- gsub(season[5], e_month[5], as.character(DNH$endmonth))
DNH$endmonth <- as.numeric(DNH$endmonth) - 1911

DNH$weighted <- as.numeric(as.character(unlist(5*DNH[6]+2*DNH[8]+2*DNH[7]+4*DNH[12])))
DNH$exag_rate <- 1
for(i in 1:nrow(DN)){
  for(j in 1:nrow(DNH)){
    if((DNH[j,14] <= DN[i,2]) && (DN[i,2] <= DNH[j,15])){
      DNH[j,17] <- (1 + (DN[i,9] / DNH[j,16]))
    }
  }
}
DNH$exaggerated <- as.numeric(as.character(unlist(DNH$weighted * DNH$exag_rate)))
DNH$avg <- as.numeric(as.character(unlist(DNH$救助金額_新臺幣千元_ / DNH$exaggerated)))

library(ggplot2)
ggplot(data=DNH, aes(x=exag_rate, y=avg))+
  geom_point(color='violet', size=4)

