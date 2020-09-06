library(shinymod)

ui = fluidPage(
        br(),
        # run button
        mk_run_button('run', label = 'Click me!'),
        br(),
        plotOutput('hist')
        )
server = function(input, output, session) {
        observeEvent(input$run, {
                output$hist = renderPlot({ hist(faithful$eruptions) })
        })
}
shinyApp(ui, server)
