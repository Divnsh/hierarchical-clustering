## clustering

cdata = read.csv('customer_hier_clus.csv',header=T)
customer = scale(cdata[,-1])

## agglomerative heirarchical clusting:
hc = hclust(dist(customer, method='euclidian'), method='ward.D2')

## plot dendrogram:
plot(hc, hang=-.01, cex=.7)

##use single method to perform heirarchical clustering:
hc2 = hclust(dist(customer), method='single')
plot(hc2, hang=-.01, cex=.7)

library(cluster)
dv = diana(customer, metric='euclidian')##divisive
ag = agnes(customer, metric = 'euclidian')##agglomerative
summary(dv)
plot(dv)
library(dendextend)


## set up dendrogram
dend = customer %>% dist %>% hclust %>% as.dendrogram

## horizontal dendrogram
dend %>% plot(horiz = T, main = 'Sidewise Dendogram')

## categorise data into groups:
fit = cutree(hc, k=4)

## Count data within each cluster:
table(fit)

## Place a rectangle around a certain cluster:
plot(hc)
rect.hclust(hc, k=4, which=1, border='red')

## Color the brach according to the cluster it belongs to:
dend %>% color_branches(k=4) %>% plot(horiz=F, main='Horiz Dendrogram')

## Add a rectangle around clusters:
dend %>% rect.dendrogram(k=4, horiz=F)

## add a line to see cutting location:
abline(h= heights_per_k.dendrogram(dend)['4']+.1, lwd=2, lty=2, col='blue')






