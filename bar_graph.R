library(ggplot2)
# load the data
data <- read.csv("./data/LA-crimes.csv", stringsAsFactors = FALSE)
use_data <- as_data_frame(transform(data, Freq = ave(seq(nrow(data)),
Victim.Descent, FUN = length)))
# function to graph a bar graph that will compare age and race for each crime
build_graph <- function(dataset, x, y, z) {
  ggplot(data = dataset, aes (x = x, y = y, fill = z)) +
    geom_bar(stat = "identity") +
    labs(
      x = "Age of Victims",
      y = "Number of Occurance of Each Race",
      fill = "Victims' Descents",
      title = paste0("Affect of Rave and Age during these Crimes")
    )
}