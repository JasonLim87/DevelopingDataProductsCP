library(shiny)

shinyUI(
  navbarPage("Car MPG Calculator", 
             # multi-page user-interface that includes a navigation bar.
             tabPanel("MPG Calculator",
                      sidebarPanel(
                        sliderInput("wt", 
                                    "Car Weight (lb/1000):", 
                                    min = 1.000,
                                    max = 6.000,
                                    value = c(2.000, 3.000),step=0.1),
                        
                        selectInput('cyl', 'Number of Cylinders',list("4"=4,"6"=6,"8"=8)),
                        
                        radioButtons("transType","Transmission Type :",
                                           c("Automatic" ="Auto",
                                             "Manual" = "Manual")                                           
                                           ),
                        numericInput("hp", "Horsepower:", 10)
                        
                      ),
                      mainPanel(
                        tableOutput("values"),
                        
                        plotOutput("mainPlot")
                      )     
             ),
             tabPanel("How to Use",
                      mainPanel(
                        h4("Step 1) Select desired inputs, Weight will be selected based on a range."),
                        h4("Step 2) Your selected inputs will be displayed on a table on the top right."),
                        h4("Step 3) Peruse the Line Chart to determine how much the MPG is on a certain Weight based on inputs selected.")
                        )
                      
                      
             ),
             tabPanel("About",
                       mainPanel(
                        h4("This is a simple Car MPG Calculator created for the Coursera Developing Data Products Course Project."),
                        h4("The dataset used to create the Linear Model is the mtcars dataset provided by R Studio."),
                        h4("mtcars itself is extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models).")
                        
           )
           
  )
)
  
  )