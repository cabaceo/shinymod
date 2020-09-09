library(shinymod)

ui = fluidPage(
        radio_buttons_ui("radios",
                         label = 'Select a value',
                         choices = c('Happy', 'Sad', 'Shocked', 'Depressed'))
        )
server = function(input, output, session) {
        radio_buttons_server("radios")
}
shinyApp(ui, server)
