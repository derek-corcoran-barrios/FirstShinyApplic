
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(raster)
library(maps)
library(maptools)
library(rgdal)
library(latticeExtra)
library(knitr)
library(gdistance)
library(plotKML)
topo <- readGDAL("speed.asc")
topo<-raster (topo)
PNF<- readGDAL("PNF.asc")
PNF<-raster (PNF)
hd <- transition(topo,mean,8,symm=FALSE)


shinyServer(
  function(input, output) {
    output$PlumasMap<- renderPlot({
      StartPoint<-cbind(input$Long1, input$Lat1)
      EndPoint<-cbind(input$Long2, input$Lat2)
      plot(PNF)
      points(StartPoint, pch=21, col="blue", bg="blue")
      points(EndPoint, pch=21, col="red", bg="red")
      PointToPoint<- shortestPath(hd, StartPoint, EndPoint, output="SpatialLines")
      lines(PointToPoint, col="black", lwd=2)  
    })
    output$oid1<-renderPrint({input$Lat1})
    output$oid2<-renderPrint({input$Long1})
    output$oid3<-renderPrint({input$Lat2})
    output$oid4<-renderPrint({input$Long2})

  }
)

