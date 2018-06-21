library(readr)

emotion <- read_tsv('data/reaction.txt')

head(emotion)

library(tidyr)

emotion %>% 
    gather(key=Type, value=Measurement, Age, BMI, React, Regulate)

emotionLong <- emotion %>% 
    gather(key=Type, value=Measurement, Age, BMI, React, Regulate)

emotionLong

emotionLong %>% 
    spread(key=Type, value=Measurement)

emotion %>% 
    unite(col='UniqueID', ID, Test)

emotion %>% 
    unite(col='UniqueID', ID, Test, sep='|')

emotion %>% 
    unite(col='UniqueID', ID, Test, remove=FALSE)

emotion %>% 
    separate(col=Age, into=c('Year', 'Fraction'))

emotion %>% 
    separate(col=Age, into=c('Year', 'Fraction')) %>% 
    dplyr::mutate(Year=as.numeric(Year))

emotion %>% 
    separate(col=Age, into=c('Year', 'Fraction'), sep='\\.', remove=FALSE)
