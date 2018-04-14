require(shiny)
library(shinythemes)


shinyUI(
  navbarPage(
    theme = shinytheme("united"),
    title = 'Corn Production in the U.S.',
    sidebarPanel(
      sliderInput(
        "Year",
        "Production year to be displayed:",
        min = 2000,
        max = 2017,
        value = 2008,
        step = 1,
        format = "###0",
        animate = TRUE
      )
    ),
    mainPanel(h2("Data Description"),
              tags$a(href="https://quickstats.nasss.usda.gov", "Link to Data Source"),
              tags$br(),
              tags$br(),
              tags$p("The Quick Stats Database is the most comprehensive tool for accessing agricultural data published by NASS.
                     It allows you to customize your query by commodity, location, or time period. You can then visualize the data on a map, 
                     manipulate and export the results, or save a link for future use."),
              
              
              h3(textOutput("year")),
              htmlOutput("gvis"))
  )
)