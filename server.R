# server.R
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(leaflet)

#Read in data in csv file
data <- read.csv("data/LA-crimes.csv", stringsAsFactors = FALSE)
vari <- strsplit(data$Location, ",")

data$lat <- sapply(vari, "[[", 1)
data$long <- sapply(vari, "[[", 2)

data$lat <- as.numeric(substr(data$lat, 2, nchar(data$lat)))
data$long <- as.numeric(substr(data$long, 0, nchar(data$long) - 1))

data <- data %>% 
  filter(lat != 0 & long != 0)

# Start shiny server
shinyServer(function(input, output) {
  
  output$mymap <- renderLeaflet({
    data %>% 
      filter(Victim.Descent == input$race & 
               Crime.Code.Description == input$crime & 
               Victim.Age >= input$range[1] & Victim.Age <= input$range[2]) %>% 
      leaflet() %>% addTiles() %>% addMarkers(
      clusterOptions = markerClusterOptions()
    )

  })

})