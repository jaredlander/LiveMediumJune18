library(rvest)

ribalta <- read_html('data/ribalta.html')
class(ribalta)

ribalta %>% html_nodes('ul')
ribalta %>% html_nodes('ul') %>% html_nodes('span')
ribalta %>% html_nodes('ul') %>% html_nodes('.street')

ribalta %>% html_nodes('.street')
ribalta %>% html_nodes('.street') %>% html_text()

ribalta %>% html_nodes('#latitude')
ribalta %>% html_nodes('#latitude') %>% html_attr('value')

ribalta %>% html_nodes('table.food-items')

ribalta %>% 
    html_nodes('table.food-items') %>% 
    magrittr::extract2(5)

ribalta %>% 
    html_nodes('table.food-items') %>% 
    magrittr::extract2(5) %>% 
    html_table()

ribalta %>% 
    html_nodes('table.food-items') %>% 
    purrr::map(html_table, fill=TRUE)

ribalta %>% 
    html_nodes('table.food-items') %>% 
    purrr::map_df(html_table, fill=TRUE)
