# server.R
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

#Read in data in csv file
data <- read.csv("data/LA-crimes.csv", stringsAsFactors = FALSE)

# Start shiny server
shinyServer(function(input, output) {

})
