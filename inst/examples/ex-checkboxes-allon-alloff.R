library(shinymod)

ui = fluidPage( checkboxes_allon_alloff_ui("hello") )
server = function(input, output, session) {
        checkboxes_allon_alloff_server("hello", label = 'Title',
                                       choices = c('Male', 'Female'))
}
shinyApp(ui, server)
