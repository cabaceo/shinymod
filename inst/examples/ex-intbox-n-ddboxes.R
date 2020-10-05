library(shinymod)

ui = miniUI::miniPage(
        miniUI::miniContentPanel(
                intbox_n_ddboxes_ui('intbox_2ddboxes',
                                    label='Enter the number of dimensions',
                                    min=2)
        )
)
server = function(input, output, session) {
        intbox_n_ddboxes_server("intbox_2ddboxes")
}
shinyApp(ui, server)
