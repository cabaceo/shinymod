library(shinymod)

ui = fluidPage(
        mk_multi_picker("iPicker",
                        label = "Select/deselect all + format selected",
                        choices = LETTERS),
        textOutput('selected_vals')
        )
server = function(input, output, session) {
        output$selected_vals = renderPrint({ input$iPicker })
}
shinyApp(ui, server)
