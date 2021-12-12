#data module
data_server<- function(id){
  
  moduleServer(id, function(input, output, session) {
    
    intermidiate <- reactive({
      ifelse(input$searchtype == "Common Name",
             
             dat <- test %>%filter(vernacularName == input$common),
             
             dat <- test %>% filter(scientificName == input$sciname))
      
      return(dat)
    })
    
    return(intermidiate)
  }
 ) 
} 