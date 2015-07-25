
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(pageWithSidebar
        (headerPanel("Plan your Survey on Plumas National Forest"),
         sidebarPanel(
           h3("Enter your starting point"),
           numericInput("Lat1","Lat",39.99999, min=39.36708, max=40.31977, step=0.00001),
           numericInput("Long1","Long",-121.1000, min=-121.6945, max=-120.0407, step=0.00001),
           h3("Enter your destination"),
           numericInput("Lat2","Lat",39.99999, min=39.36708, max=40.31977, step=0.00001),
           numericInput("Long2","Long",-120.5000, min=-121.6945, max=-120.0407, step=0.00001)
         ),
         mainPanel(
           plotOutput("PlumasMap"),
           h5("The blue point is your starting point"),
           h5("The red point is your destination"),
           h5("The black line is your path"),
           submitButton("Submit"),
           )
        ))

#