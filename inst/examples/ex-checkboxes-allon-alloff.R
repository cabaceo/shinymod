library(shinymod)

ui = fluidPage(
        checkboxes_allon_alloff_ui("hello", align_onoff_bttns = 'horizontal',
                                   line_breaks_bw_cboxes_n_vbttns = 2,
                                   hbttns_height = 60, hbttns_width = '50%'
                                   ),

        checkboxes_allon_alloff_ui("hello2", align_onoff_bttns = 'vertical',
                                   line_breaks_bw_cboxes_n_vbttns=1,
                                   vbttns_height = 600, vbttns_width = '100%')
        )
server = function(input, output, session) {
        checkboxes_allon_alloff_server("hello", label = 'Title',
                                       choices = c('Male', 'Female'))

        checkboxes_allon_alloff_server("hello2", label = 'Income',
                                       choices = c('<50,000', '>50,000'))
}
shinyApp(ui, server)



