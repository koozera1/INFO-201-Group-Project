library(ggplot2)
# load the data
data <- read.csv("./data/LA-crimes.csv", stringsAsFactors = FALSE)

# function to graph a bar graph that will compare age and race for each crime
build_graph <- function(dataset, x, y) {
  ggplot(data = dataset, aes (x = x, y = y)) +
    geom_bar(stat = "identity") +
    labs(
      x = "Victims' Descents",
      y = "Age of Victims",
      title = paste0("Age and Race of the victims in the Crimes")
    )
}