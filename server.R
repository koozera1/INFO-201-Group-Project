# server.R
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)
library(stringr)

#Read in data in csv file
data <- read.csv("data/LA-crimes.csv", stringsAsFactors = FALSE)

data <- mutate(data, Year.Occurred = str_sub(data$Date.Occurred, start = -4))

# Start shiny server
shinyServer(function(input, output) {
  output$weapons_bar <- renderPlot({
    if (input$year != "All") {
      filtered <- filter(data, Year.Occurred == input$year)
      p <- ggplot() +
        geom_bar(mapping = aes(
          x = filtered$Weapon.Description
        )) +
        labs(
          x = input$x,
          title = paste0("Weapons Used in ", input$year)
        )
    } else {
      p <- ggplot() +
        geom_bar(mapping = aes(
          x = data$Weapon.Description, fill = data$Year.Occurred
        )) +
        labs(
          x = "Weapon used",
          title = paste0("Weapons Used in ", input$year, " Years")
        )
    }
    p
  })
})

