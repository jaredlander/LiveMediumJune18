theList <- list(A=1:100, B=c(3, 7, 4), C=5, D=23:38)
theList

library(purrr)
theList %>% map(sum)

library(doParallel)

detectCores()

cl <- makeCluster(3)
cl
class(cl)

registerDoParallel(cl)

foreach(a=theList) %dopar%
{
    sum(a)
}

foreach(a=theList, .combine=c) %dopar%
{
    sum(a)
}

foreach(a=theList, .combine=c, .multicombine=TRUE, .inorder=FALSE) %dopar%
{
    sum(a)
}
