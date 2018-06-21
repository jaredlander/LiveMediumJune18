library(purrr)

theList <- list(1:100, c(3, 5, 2), 7, 6)
theList

theList[[1]]
theList[[2]]
theList[[3]]
theList[[4]]

sum(theList[[1]])
sum(theList[[2]])
sum(theList[[3]])
sum(theList[[4]])

for(a in theList)
{
    print(sum(a))
}

map(theList, sum)

newList <- map(theList, sum)
newList

theList %>% map(sum)

theList %>% map(mean)
theList %>% map_dbl(mean)

theList %>% map_int(mean)

theList %>% map_dbl(mean) %>% sum()

theList %>% map(class)
theList %>% map_chr(class)
