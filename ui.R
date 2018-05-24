# Libraries
library(plotly)
library(shiny)

# ui.R
shinyUI(navbarPage(
  "Crime in LA",
  
  # Creates a tab for the bar graph
  tabPanel(
    "Map",
    titlePanel("State vs Population"),
    
    # Create a sidebar layout
    sidebarLayout(
      
      # Create a sidebar panel
      sidebarPanel(
        

      ),
      
      # Main panel: display plotly  bar
      mainPanel(
        #plotlyOutput("bar")
      )
    )
  )
))
