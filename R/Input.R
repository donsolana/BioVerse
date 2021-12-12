#sidebar UI module

data_input_sidebar <- function(id, ...){
  sidebarPanel(
    selectInput(NS(id,"searchtype"),
                "select search type",
                choices = c("Common Name", "Scientific Name"),
                selectize = T),
    
    selectInput(NS(id, "country"),
                "Select Country", 
                choices = unique(test$country),
                selectize = T),
    
    selectInput(NS(id,"common"), 
                "Search common names", 
                choices = head(unique(test$vernacularName)),
                selectize = T),
    
    h4("Or"),
    
    selectInput(NS(id,"sciname"),
                "Search scientific name", 
                choices = head(unique(test$scientificName)), 
                selectize = T),
    ...
  )
}
