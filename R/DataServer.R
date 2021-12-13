#data module
data_server<- function(id){
  
  moduleServer(id, function(input, output, session) {
    
    intermidiate <- reactive({
      ifelse(input$searchtype == "Common Name",
             
             dat <- test %>% dplyr::filter(vernacularName == input$common),
             
             dat <- test %>% dplyr::filter(scientificName == input$sciname))
      
      return(dat)
    })
    
    return(intermidiate)
  }
 ) 
} 
