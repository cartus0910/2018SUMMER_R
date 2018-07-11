library(readr)
NTUGEOG_R <- read_csv("NTUGEOG+R.csv")
head(NTUGEOG_R)

mixseg = worker()
jieba_tokenizer=function(d){
  unlist(segment(d[[1]],mixseg))
}
seg = lapply(NTUGEOG_R$論文名稱, jieba_tokenizer)
freqFrame = as.data.frame(table(unlist(seg)))
freqFrame = freqFrame[order(freqFrame$Freq,decreasing=TRUE), ]
library(knitr)
kable(head(freqFrame), format = "markdown")

library(stringr)
new_freqFrame = subset(freqFrame, nchar(str_sub(freqFrame$Var1))>=2)
kable(head(new_freqFrame), format = "markdown")
new_freqFrame = new_freqFrame[-1,]

wordcloud2(new_freqFrame, minSize=5, gridSize=5, fontFamily = "微軟正黑體",
           backgroundColor='black', color='random-light')
letterCloud(new_freqFrame, word='GEOG', size=1, fontFamily = "微軟正黑體",
            backgroundColor='black', color='random-light', gridSize=5)