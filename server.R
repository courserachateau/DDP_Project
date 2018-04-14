# KDhakal, April 2018
require(googleVis)
require(shiny)
## Prepare data to be displayed
## Load Corn production data by state from 2000 -2017
library(RCurl)
url <- 'https://pastebin.com/raw/dVNrCuH4'
dat <- getURL(url, ssl.verifypeer=0L, followlocation=1L)
dat <- read.csv(text=dat)
dat <- subset(dat, dat$commodity_desc == "CORN")

shinyServer(function(input, output) {
  myYear <- reactive({
    input$Year
  })
  output$year <- renderText({
    paste0("Corn Area Harvested (ha): ", myYear())
  })
  output$gvis <- renderGvis({
    myData <- subset(dat, 
                     (year > (myYear()-1)) & (year < (myYear()+1)))
    gvisGeoChart(myData,
                 locationvar="state_name", colorvar="Val_ha", 
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              width=500, height=400,
                              colorAxis="{colors:['#edf8e9', '#006d2c']}"
                 ))     
  })
})