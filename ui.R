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

    p(HTML(paste0(
      "We used the dataset ",

      a(
        href = "https://catalog.data.gov/dataset/crime-data-from-2010-to-present",
        "Crime Data from 2010 to Present"
      ),

      ". This data is drawn from the public crime dataset collected by the local
       government of Los Angeles starting in 2010. Our project intends to
       analyze distressed areas of crimes, victims, use of weapons, and other
       information. Our main goal was to provide government officials with the
       information they need to understand crimes in Los Angeles. The map
       provides the audience with detailed information about the location and
       frequency of different types of crimes. You can gain insight on the
       public safety of the area by using the analysis. The other visualizations
       give specific details about the crimes, such as the weapons used and
       other information."
    ))),

    tags$br(),

    p("Contributors: Andrea Koozer, Mustafa Ahamed, Jill Nguyen, Joy Liu.")
  ),

  # Creates a tab for the map
  tabPanel(
    "Map",
    titlePanel("Map of Crimes in Los Angeles"),
    p("The map display distressed areas based on victims' races, age ranges and
       the type of crimes. It may take a while to load due to the large amount
       of data."),

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
    titlePanel("Weapons Used in Crimes"),
    p("Choose a year to learn more about frequencies of different types of
       weapons used in crimes."),
    p("A new set of data is randomly selected every time a widget's selection
       is changed. It may take a while to load due to the large amount of
       data."),
    sidebarLayout(
      sidebarPanel(
        selectInput("year", label = "Year occurred", choices = select_year),
        uiOutput("weapons_slider"),
        radioButtons(
          "sort",
          label = "Sort by", choices = c("Alphabetical", "Count"),
          selected = "Alphabetical"
        )
      ),
      mainPanel(
        plotOutput("weapons_bar")
      )
    )
  ),

  tabPanel(
    "Race VS Age",
    titlePanel("Crime Rates In LA"),
    p("This graph gives a visual representation of how age and race are affected 
      by crimes"),
    sidebarPanel(
      # Input to select variable to map
      selectInput(
        "Race",
        label = "Race",
        choices = list("Victims' Race" = "Victim.Descent")
      ),
      selectInput(
        "Age",
        label = "Age",
        choices = list("Victim's Age" = "Victim.Age")
      ),
      selectInput(
        "Freq",
        label = "Occurance of each Race",
        choices = list("Occurance" = "Freq")
      ),
      p("Due to some difficulty with the program, the Legend of the graph
        looks like that. But each letter and color corresponds to each race like
        this O = Other, B = Black, W = White, A = Asian and
        H = Hispanic")
      
    ),
    mainPanel(
      plotOutput("bar")
    )
  )
))
