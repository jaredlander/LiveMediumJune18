library(rvest)

ribalta <- read_html('data/ribalta.html')
class(ribalta)

ribalta %>% html_nodes('ul')
ribalta %>% html_nodes('ul') %>% html_nodes('span')
ribalta %>% html_nodes('ul') %>% html_nodes('.street')

ribalta %>% html_nodes('.street')
ribalta %>% html_nodes('.street') %>% html_text()
