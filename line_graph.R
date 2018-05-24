df <- read.csv("./data/LA-crimes.csv")
View(df)

library("plotly")

xvar <- df$Date.Occurred
yvar <- df$Date.Reported
plot_ly(dt, type = 'scatter', x = xvar , y = yvar , mode = 'line')
