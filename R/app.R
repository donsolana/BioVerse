#packages
require("shiny")
require("shinythemes")
require("dplyr")
require('leaflet')
require("ggplot2")
require("lubridate")
source("MapModule.R")
source("Input.R")
source("DataServer.R")
source("TimeLine.R")



########UI#######
bio_diverse<- function(){
  test <<- read.csv("test.csv")
  
  ui <- navbarPage(
    theme = bslib::bs_theme(bg = "rgb(231, 251, 233)", fg = "rgb(6, 30, 12)", 
                            primary = "#121412", secondary = "#2BF30A", font_scale = NULL, 
                            `enable-gradients` = TRUE, `enable-shadows` = TRUE, 
                            `enable-rounded` = TRUE, bootswatch = "cosmo"),
    title = "BioVerse",
    
    MapUI("bio1"),
    TimelineUI("bio1")
    
  )
  
  
  
  server <- function(input, output){
    
    TimelineServer("bio1")
    
    MapServer("bio1") 
    
  }
  
  shinyApp(ui, server)
}

bio_diverse()