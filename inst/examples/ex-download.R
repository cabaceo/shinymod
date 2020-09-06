library(shinymod)

gg = ggplot2::ggplot(iris, aes(Sepal.Length, Sepal.Width))+ggplot2::geom_point()

ui = fluidPage(
        br(),
        # CSV download button
        download_ui("iris", label = 'Download Iris Dataset'),
        br(), br(),
        # PNG download button
        download_ui("plt", label = 'Download Plot')
        )
server = function(input, output, session) {
        download_server("iris", obj = iris, fname = 'iris', ftype = 'csv')
        download_server("plt", obj = gg, fname = 'sepal_width_vs_length',
                        ftype = 'png')
}
shinyApp(ui, server)
