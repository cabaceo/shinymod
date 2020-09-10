library(shinymod)

ui = fluidPage(
        br(),
        mk_slider('slider', label = 'Slide me!', min = 0, max = 1, value = 0.1),
        br(),
        plotOutput('hist')
        )
server = function(input, output, session) {
        output$hist = renderPlot({ hist(rnorm(500, mean = input$slider)) })
}
shinyApp(ui, server)
