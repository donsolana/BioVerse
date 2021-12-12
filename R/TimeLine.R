## Time Line Module
TimelineUI <-  function(id){
  tabPanel("Time",
           sidebarLayout(
             data_input_sidebar(NS(id, "time")),
             mainPanel(
               plotOutput(
                 NS(id, "timeplot")
               )
             )
           )
  )
}


###TimelineServer
TimelineServer <- function(id){
  
  moduleServer(id, function(input, output, session) {
    
    #Data for Map
    data_time <- data_server("time")
    
    species_over_time <- reactive({
      data_time() %>%
        select(eventDate, individualCount, vernacularName) %>%
        mutate(year = year(eventDate)) %>%
        group_by(year) %>%
        mutate(total_count = sum(individualCount))
    })
    
    output$timeplot <- renderPlot({
      species_over_time() %>% 
        ggplot(aes(year, total_count)) +
        geom_line(color = "darkred", size = 5) +
        theme_bw() +
        labs(title = paste(species_over_time()$vernacularName, "Observations Over Time"))
    })
  }
 )
}
