#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
# 1. Loading 
data("mtcars")
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Exploring mtcars"),
  
  pageWithSidebar(
    h4('via k-means clustering'),
    
    sidebarPanel(
      h4('Select some variables and start exploring the mtcars'),
      
      selectInput('xcol', 'X Variable', names(mtcars)),
      selectInput('ycol', 'Y Variable', names(mtcars),
                  selected=names(mtcars)[[2]]),
      
      h5('Number of clusters'),
      numericInput('clusters', 'Cluster count', 3,
                   min = 1, max = 9),
      h5('Size of the symbols according to'),
      radioButtons('w', 'Size Variable', names(mtcars),
                   selected=names(mtcars)[[6]])
      
    ),
    mainPanel(
      h5('Colors display the clusters and the black dots their centers'),
      plotOutput('plot1')
    )
  )
  
))

