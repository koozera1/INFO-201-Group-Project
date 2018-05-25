# Libraries
library(plotly)
library(shiny)
library(shinythemes)

# ui.R
shinyUI(navbarPage(
  theme = shinytheme("journal"), "Crime in LA",
  
  
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
  
  # Creates a tab for the map
  tabPanel(
    "Map",
    titlePanel("Map of Crimes in Los Angeles"),
    p("The map may take a while to load due to the large amount of data."),
    
    # Create a sidebar layout
    sidebarLayout(
      
      # Create a sidebar panel
      sidebarPanel(
        
        selectInput(
          "race",
          label = "Victim Race",
          choices = list(
            "White" = "W",
            "Hispanic" = "H",
            "Black" = "B",
            "Other" = "O"
          )
        ),
        
        sliderInput("range", "Victim Age", min(data$Victim.Age), max(data$Victim.Age),
                    value = range(data$Victim.Age), step = 1
        ),
        
        selectInput(
          "crime",
          label = "Crime Description",
          choices = list(
            "Robbery" = "ROBBERY",
            "Attempted Robbery" = "ATTEMPTED ROBBERY",
            "Bomb Scare" = "BOMB SCARE",
            "Forced Rape" = "RAPE, FORCIBLE",
            "Attempted Rape" = "RAPE, ATTEMPTED",
            "Kidnapping" = "KIDNAPPING",
            "Theft($950 and under)" = "THEFT PLAIN - PETTY ($950 & UNDER)",
            "Theft($950.01 and over)" = 
              "THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD0036"  ,
            "Arson" = "ARSON"
          )
        )
      ),
      
      # Main panel: display map
      mainPanel(
        leafletOutput("mymap")
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
