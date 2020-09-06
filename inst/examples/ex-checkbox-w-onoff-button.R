library(shinymod)

ui <- fluidPage( checkbox_w_onoff_button_ui("hello") )
server <- function(input, output, session) {
        checkbox_w_onoff_button_server("hello", label = 'Title',
                                       choices = c('Male', 'Female'))
}
shinyApp(ui, server)
