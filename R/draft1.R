#Map
install.packages("leaflet")
library(leaflet)
library(dplyr)
a <- "Common Name"

data <- ifelse(reactive{((searchterm == "Common Name")}),
       reactive({test %>%filter(vernacularName == "Great Tit")}),
       reactive({test %>% filter(vernacularName == "Carrion Crow"))})


O