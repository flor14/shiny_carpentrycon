library(shiny)
library(ggplot2)

ui <- fluidPage(
    radioButtons(inputId = "xaxis",
                 label = "Select variable for x axis",
                 choices = c("Petal width" = "Petal.Width" ,
                             "Sepal width" = "Sepal.Width"),
                 inline = TRUE),
    plotOutput("plot")

)

server <- function(input, output, session) {

  output$plot <-  renderPlot({  ggplot(data=datasets::iris,
                                  aes_string(x= input$xaxis,
                                   y="Sepal.Length",
                                   color="Species")) +
                                geom_point(size = 3, alpha = 0.5) })

}

shinyApp(ui, server)