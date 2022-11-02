library(shiny)
library(shinymod)

gg = ggplot2::ggplot(iris, ggplot2::aes(Sepal.Length, Sepal.Width)) +
        ggplot2::geom_point()

ui = fluidPage(
        br(),
        # CSV download button
        download_ui("iris", label = 'Download Iris Dataset'),
        br(), br(),
        # PNG download button
        download_ui("plt", label = 'Download Plot'),
        br(), br(),
        textInput('text', label = 'Enter some text'),
        download_ui('download_entered_txt', label = 'Download Text'),
        br(), br(),
        download_ui('pdf', label = 'Download as PDF'),
        )
server = function(input, output, session) {
        download_server("iris", obj = iris, fname = 'iris', ftype = 'csv')
        download_server("plt", obj = gg, fname = 'sepal_width_vs_length',
                        ftype = 'png')
        download_server('download_entered_txt', obj=input$text, ftype='txt',
                        fname='user_input')
        download_pdf_server("pdf",
                            template_fname="pdf-template.Rmd",
                            fname='report',
                            content=input$text)

}
shinyApp(ui, server)
