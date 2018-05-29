# Libraries
library(plotly)
library(shiny)
library(dplyr)
library(shinythemes)
library(stringr)
library(leaflet)

# values to select the year in weapons
data <- read.csv("data/LA-crimes.csv", stringsAsFactors = FALSE)
data$Year.Occurred <- str_sub(data$Date.Occurred, start = -4)
select_year <- append(
  unlist(
    distinct(data, Year.Occurred) %>% arrange(Year.Occurred),
    use.names = FALSE
  ),
  "all"
)

# ui.R
shinyUI(navbarPage(
  theme = shinytheme("journal"), "Crime in LA",


  # Creates a tab for the summary
  tabPanel(
    "Summary",
    titlePanel("Crime Rates In LA"),

    # Create a sidebar layout
    sidebarLayout(

      # Create a sidebar panel
      sidebarPanel(
        helpText("Our final project draws on data from the public crime dataset collected by the local government of Los Angeles starting in 2010. 
                 Our project intends to analyze distressed areas of crimes, victims, use of weapons, and other information. 
                 The map provides the audience with detailed information about the location, frequency of each type of crimes. You can gain insight on the public safety of the area by using the analysis. 
                 Contributers: Andrea Koozer, Mustafa Ahamed, Jill Nguyen, Joy Liu.")
      ),

      # Main panel: display plotly  bar
      mainPanel(
        # plotlyOutput("bar")
      )
    )
  ),

  # Creates a tab for the map
  tabPanel(
    "Map",
    titlePanel("Map of Crimes in Los Angeles"),
    p("The map display distressed areas based on victims' races, age ranges and the type of crimes. It may take a while to load due to the large amount of data."),

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

        sliderInput(
          "range",
          label = "Victim Age", min(data$Victim.Age), max(data$Victim.Age),
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
              "THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD0036",
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

  # tab for weapons visualization
  tabPanel(
    "Weapons",
    titlePanel("Choose a year to learn more about frequencies of different types of weapons used in crimes."),
    p("This tab "),
    sidebarLayout(
      sidebarPanel(
        selectInput("year", label = "Year Occurred", choices = select_year),
        sliderInput(
          "amount",
          label = "Amount of data observed", min(100), max(count(data)),
          value = 100, step = 100
        )
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
      sidebarPanel(),

      # Main panel: display plotly  bar
      mainPanel(
        # plotlyOutput("bar")
      )
    )
  ),

  tabPanel(
    "Bar",
    titlePanel("Crime Rates In LA"),

    # Create a sidebar layout
    sidebarLayout(

      # Create a sidebar panel
      sidebarPanel(),

      # Main panel: display plotly  bar
      mainPanel(
        # plotlyOutput("bar")
      )
    )
  )
))

