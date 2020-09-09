library(shinymod)

ui = fluidPage(
        dropdown_box_ui("dropdown",
                        label = 'This is a plain dropdown box',
                        choices = c('Male', 'Female'))
        )
server = function(input, output, session) {
        dropdown_box_server("dropdown")
}
shinyApp(ui, server)
