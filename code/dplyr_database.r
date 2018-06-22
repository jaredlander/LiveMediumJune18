library(dplyr)
library(DBI)

con <- dbConnect(RSQLite::SQLite(), 'data/diamonds.db')
con
class(con)

dbListTables(con)
dbListFields(con, 'diamonds')

diaTab <- tbl(con, 'diamonds')
diaTab
nrow(diaTab)
class(diaTab)
pryr::object_size(diaTab)

diaTab %>% select(carat, price)
diaTab %>% filter(cut == 'Ideal')

diaTab %>% mutate(Ratio=price/carat)
diaTab

diaTab %>% 
    group_by(cut) %>% 
    summarize(Price=mean(price))

diaTab %>% 
    group_by(cut) %>% 
    summarize(Price=AVG(price))

dbplyr::translate_sql(
    diaTab %>% 
        group_by(cut) %>% 
        summarize(Price=AVG(mean))
)

colorTab <- tbl(con, 'diamondColors')
colorTab
pryr::object_size(colorTab)


left_join(diaTab, colorTab, by=c('color'='Color'))

joinedTab <- left_join(diaTab, colorTab, by=c('color'='Color')) %>% collect()
