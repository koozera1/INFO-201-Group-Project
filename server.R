# server.R
library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

#Read in data in csv file
data <- read.csv("data/LA-crimes.csv", stringsAsFactors = FALSE)
vari <- strsplit(data$Location, ",")

test %>% 
  

data <- data %>% 
  mutate(lat = lapply(substr(vari, 2, nchar(vari)))) %>% 
  mutate(lng = substr(data$Location[2], 1, nchar(data$Location) - 2))


# Start shiny server
shinyServer(function(input, output) {

})


test <- strsplit(data$Location, ",")
test[[1]][1]


lapply()