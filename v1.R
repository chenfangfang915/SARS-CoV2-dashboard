library(shiny)

ui <- fluidPage(
           tags$img(height = 100,width = 100,src = "virology_logo_black.png"), #Add an image.(src:source)),
           tags$h1("SARS-CoV2 Variants Monitor Dashboard"),
           #tags$br(), #A line break
  actionButton(inputId = "global", label = "Global"),
  actionButton(inputId = "philippines", label = "Philippines"),
  actionButton(inputId = "japan", label = "Japan"),
  plotOutput("hist")          ##
)

server <- function(input, output) {
  
  rv <- reactiveValues(data = rnorm(100))
  
  observeEvent(input$global, { rv$data <- rnorm(100) })
  observeEvent(input$philippines, { rv$data <- rnorm(100) })
  observeEvent(input$japan, { rv$data <- runif(100) })
  
  output$hist <- renderPlot({ 
    hist(rv$data) 
  })
}

shinyApp(ui = ui, server = server)