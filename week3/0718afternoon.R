setwd('D:/2018.07 R_DataAnalysis/2018SUMMER_R/data')

library(NLP)
library(tm)
library(tmcn)
library(factoextra)
library(Matrix)
library(bitops)
library(httr)
library(RCurl)
library(XML)
library(jiebaRD)
library(jiebaR)
require("XML")

from <- 6912 # 2018-03-25
to   <- 6940 # 2018-03-31
prefix = "https://www.ptt.cc/bbs/movie/index"

data <- list()
for( id in c(from:to) )
{
  url  <- paste0( prefix, as.character(id), ".html" )
  html <- htmlParse( GET(url) )
  url.list <- xpathSApply( html, "//div[@class='title']/a[@href]", xmlAttrs )
  data <- rbind( data, as.matrix(paste('https://www.ptt.cc', url.list, sep='')) )
}
data <- unlist(data)

library(dplyr)
getdoc <- function(url)
{
  html <- htmlParse( getURL(url) )
  doc  <- xpathSApply( html, "//div[@id='main-content']", xmlValue )
  time <- xpathSApply( html, "//*[@id='main-content']/div[4]/span[2]", xmlValue )
  temp <- gsub( "  ", " 0", unlist(time) )
  part <- strsplit( temp, split=" ", fixed=T )
  #date <- paste(part[[1]][2], part[[1]][3], part[[1]][5], sep="-")
  #date <- paste(part[[1]][2], part[[1]][5], sep="_")
  #date <- paste(part[[1]][1], part[[1]][2], sep="_")
  timestamp <- part[[1]][4]
  timestamp <- strsplit( timestamp, split=":", fixed=T )
  hour <- timestamp[[1]][1]
  #print(hour)
  name <- paste0('./DATA/', hour, ".txt")
  write(doc, name, append = TRUE)
}

sapply(data, getdoc)
