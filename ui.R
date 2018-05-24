# Libraries
library(plotly)
library(shiny)
library(dplyr)

# values to select the year in weapons
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
  
  # tab for weapons visualization
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
