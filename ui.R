# Libraries
library(plotly)
library(shiny)

# ui.R
shinyUI(navbarPage(
  "Crime in LA",
  
  
  # Creates a tab for the bar graph
  tabPanel(
    "Summary",
    titlePanel("Crime Rates In LA"),
    
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
  ),
  
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
  ),
  
  tabPanel(
    "Line",
    titlePanel("Crime Rates In LA"),
    
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
  ),
  
  tabPanel(
    "Bar",
    titlePanel("Crime Rates In LA"),
    
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
