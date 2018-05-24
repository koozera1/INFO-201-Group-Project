# Libraries
library(plotly)
library(shiny)
library(dplyr)

select_year <- append(
  unlist(
    distinct(data, Year.Occurred) %>% arrange(Year.Occurred),
    use.names = FALSE
  ),
  "All"
)

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
  ),
  tabPanel(
    "Weapons",
    titlePanel("Types of Weapons Used"),
    sidebarLayout(
      sidebarPanel(
        selectInput("year", label = "Year Occurred", choices = select_year)
      ),
      mainPanel(
        plotOutput("weapons_bar")
      )
    )
  )
))
