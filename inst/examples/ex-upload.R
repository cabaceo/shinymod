library(shinymod)

ui = fluidPage( br(), upload_ui("upload") )
server = function(input, output, session) {
        upload_server("upload")
}
shinyApp(ui, server)
