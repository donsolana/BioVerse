##This Script contains the map module
#
#The UI is composed of a sidebar module and additional components implemented in Input.R
#
#The server module is composed of the Data Server

## Map UI
MapUI <-  function(id){
  tabPanel("Map View",
           sidebarLayout(
             data_input_sidebar(NS(id, "map"), width = 2),
             mainPanel(
               leafletOutput(
                 NS(id, "mapplot")
               ),
               width = 10
             )
           )
  )
}



#Map Server
MapServer <- function(id){
  moduleServer(id, function(input, output, session) {
    #Data for Map
    data_map <- data_server("map")
    
    output$mapplot <- renderLeaflet({ 
      leaflet() %>%
        addTiles() %>%
        addMarkers(lng = data_map()$longitudeDecimal, lat = data_map()$latitudeDecimal)
    })
  }
 )
}




