library(readr)

emotion <- read_tsv('data/reaction.txt')

head(emotion)

library(tidyr)

emotion %>% 
    gather(key=Type, value=Measurement, Age, BMI, React, Regulate)
