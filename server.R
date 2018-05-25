# server.R
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(leaflet)
library(stringr)

#Read in data in csv file
data <- read.csv("data/LA-crimes.csv", stringsAsFactors = FALSE)
vari <- strsplit(data$Location, ",")

#Creating lat and long columns
data$lat <- sapply(vari, "[[", 1)
data$long <- sapply(vari, "[[", 2)
data$lat <- as.numeric(substr(data$lat, 2, nchar(data$lat)))
data$long <- as.numeric(substr(data$long, 0, nchar(data$long) - 1))

#Getting rid of all the latitudes and longitudes with no values
data <- data %>% 
  filter(lat != 0 & long != 0)

#Create a new column with the year
data$Year.Occurred = str_sub(data$Date.Occurred, start = -4)

# Start shiny server
shinyServer(function(input, output) {
  
  #Map
  output$mymap <- renderLeaflet({
    data %>% 
      filter(Victim.Descent == input$race & 
               Crime.Code.Description == input$crime & 
               Victim.Age >= input$range[1] & Victim.Age <= input$range[2]) %>% 
      leaflet() %>% addTiles() %>% addMarkers(
      clusterOptions = markerClusterOptions()
    )

  })

  #weapons bar graph
  output$weapons_bar <- renderPlot({
    if (input$year != "all") {
      filtered <- filter(data, Year.Occurred == input$year)
      p <- ggplot() +
        geom_bar(mapping = aes(
          x = filtered$Weapon.Description
        )) +
        labs(
          x = input$x,
          title = paste0("Weapons used in ", input$year)
        )
    } else {
      p <- ggplot() +
        geom_bar(mapping = aes(
          x = data$Weapon.Description, fill = data$Year.Occurred
        )) +
        labs(
          x = "Weapon used",
          title = paste0("Weapons used in ", input$year, " years")
        )
    }
    p
  })
  
})

