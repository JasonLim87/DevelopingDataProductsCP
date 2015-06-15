library(shiny)

source("DataProduct.R")

shinyServer(
  function(input, output) {
    selectedValues<-reactive({
     data.frame(
       Name=c("Weight","Cylinders","Transmission Type","Horsepower"),
       Value = as.character(c(paste(input$wt, collapse=' to '),input$cyl,paste(input$transType, collapse=' and '),input$hp))
       )
      
    }
      )
    
    buildPlotData<-reactive({
      buildPlot(input$cyl,input$hp,input$wt[1],input$wt[2],0.1,input$transType)
    })
    
    output$values <- renderTable({
      selectedValues()
    })
    
    output$mainPlot <- renderPlot({
      buildPlotData()
    })
  }
  
  
)