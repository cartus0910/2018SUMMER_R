setwd('D:/2018.07 R_DataAnalysis/2018SUMMER_R/data')

library(tm)
library(tmcn)
library(factoextra)
library(Matrix)

docs.corpus <- Corpus(DirSource("./0718", encoding = 'UTF-8'))
docs.seg <- tm_map(docs.corpus, segmentCN)
docs.tdm <- TermDocumentMatrix(docs.seg)

docs.tf <- apply(as.matrix(docs.tdm), 2, function(word) { word/sum(word) })
idf <- function(doc) {
  return ( log2( length(doc)+1 / nnzero(doc)) )
}
docs.idf <- apply(as.matrix(docs.tdm), 1, idf)
docs.tfidf <- docs.tf * docs.idf

library(wordcloud2)
f <- sort(rowSums(docs.tfidf), decreasing = T)
docs.df <- data.frame(
  word = names(f),
  freq = f
)
wordcloud2(docs.df, minSize=10, gridSize=5, fontFamily = "微軟正黑體",
           backgroundColor='black', color='random-light')

docs.pca <- prcomp(docs.tfidf, scale = T)
fviz_eig(docs.pca)
fviz_pca_ind(docs.pca, geom.ind = c("point"), col.ind = "cos2")
fviz_pca_var(docs.pca, col.var = "contrib")
fviz_pca_biplot(docs.pca, geom.ind = "point")

docs.eig <- get_eig(docs.pca)
docs.var <- get_pca_var(docs.pca)
docs.ind <- get_pca_ind(docs.pca)
ind.coord2 <- docs.ind$coord[, 1:2]
wss <- c()
for (i in 1:10) { wss[i] <- kmeans(ind.coord2, i)$tot.withinss }
plot(wss, type = "b")

km <- kmeans(ind.coord2, 5)
plot(ind.coord2, col = km$cluster)
points(km$centers, col = 1:3, pch = 8, cex = 2)








