#' @title A group of checkboxes with all-on/all-off control buttons.
#'
#' @description
#' The UI component of the Shiny module for creating a group of pretty
#' checkboxes with an all-on and an all-off control buttons.
#'
#' @usage
#' checkboxes_allon_alloff_ui('id', align_onoff_bttns = 'horizontal',
#'     hbttns_height = "100\%", hbttns_width = "100\%")
#' checkboxes_allon_alloff_ui('id', align_onoff_bttns = 'vertical',
#'     line_breaks_bw_cboxes_n_vbttns = 1, vbttns_height = "100\%",
#'     vbttns_width = "100\%")
#' @param id    String. The input slot that will be used to access the value.
#' @param bttn_size String. Size of the button : 'xs', 'sm', 'md', 'lg'.
#' @param align_onoff_bttns String. Possible values are 'vertical' (default) or
#'        'horizontal'. If 'vertical', the all-on and all-off buttons are stacked
#'        vertically. Otherwise, they are placed horizontally side by side.
#' @param line_breaks_bw_cboxes_n_vbttn1,line_breaks_bw_vbttn1_n_vbttn2 Integer.
#'        Number of line breaks between the checkboxes group and the 1st
#'        vertical button, and between the 1st and 2nd vertically stacked
#'        buttons. Only used when `align_onoff_bttns = 'vertical'`.
#' @param hbttns_height,hbttns_width The total amount of height and width
#'        to use for the entire column of the horizontally aligned buttons group.
#'        Their values will be passed into `fillRow()`. Only used when
#'        `align_onoff_bttns = 'horizontal'`.
#' @return Must use it together with its counterpart server.
#' @seealso \code{\link{checkboxes_allon_alloff_server}} for the server.
#' @export
#' @examples inst/examples/ex-checkboxes-allon-alloff.R
checkboxes_allon_alloff_ui =
        function(id, bttn_size = 'md', align_onoff_bttns = 'vertical',
                 line_breaks_bw_cboxes_n_vbttn1 = 1,
                 line_breaks_bw_vbttn1_n_vbttn2 = 1,
                 hbttns_height = '100%', hbttns_width = '100%') {
        ns = NS(id)

        # all-on and all-off buttons
        allon_bttn = shinyWidgets::actionBttn(
                ns("allon"), "All On", color = "default", size = bttn_size)
        alloff_bttn = shinyWidgets::actionBttn(
                ns("alloff"), "All Off", color = "warning", size = bttn_size)

        if (align_onoff_bttns == 'vertical') {
                # stack on/off buttons vertically under the checkboxes
                tagList(uiOutput(ns("placeholder")),
                        linebreaks(line_breaks_bw_cboxes_n_vbttn1),
                        allon_bttn,
                        linebreaks(line_breaks_bw_vbttn1_n_vbttn2),
                        alloff_bttn,
                        linebreaks(1)
                        )
        } else { # put on/off buttons horizontally side by side under the checkboxes
                tagList(uiOutput(ns("placeholder")),
                        fillRow(allon_bttn, alloff_bttn,
                                flex = c(3, 7), # left button takes up 30% space
                                height = hbttns_height, width = hbttns_width
                                )
                        )
        }
}



#' @title Implement the control of checkboxes by all-on/all-off buttons.
#'
#' @description
#' The server component of the Shiny module for creating a group of pretty
#' checkboxes with an all-on and an all-off control buttons.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Display label/title for the checkboxes group, or
#'        NULL (default) for no label.
#' @param choices Character vector. List of values to show checkboxes for.
#'        If elements of the list are named then that name rather than the value
#'        is displayed to the user. The values should be strings; other types
#'        (such as logicals and numbers) will be coerced to strings.
#' @param init_checked Character vector. List of values checked initially when
#'        displaying the group of checkboxes for the first time. Default is
#'        to have all choices checked initally.
#' @return A module server function that can be called in a reactive env.
#' @seealso \code{\link{checkboxes_allon_alloff_ui}} for the UI, and
#'          \code{\link{mk_checkboxes}} for how the group checkboxes are made.
#' @export
#' @examples inst/examples/ex-checkboxes-allon-alloff.R
checkboxes_allon_alloff_server = function(id, label = NULL,
                                          choices, init_checked = choices) {
        moduleServer(id, function(input, output, session) {
                ns = session$ns

                # first, we display the checkboxes all checked
                output$placeholder = renderUI({
                        mk_checkboxes(ns('checkboxes'),
                                      label = label,
                                      choices = choices,
                                      selected = init_checked)
                })

                # check off all boxes when the all-off button is clicked
                observeEvent(input$alloff, {
                        output$placeholder = renderUI({
                                mk_checkboxes(ns('checkboxes'),
                                              label = label,
                                              choices = choices,
                                              selected = NULL)
                        })
                })

                # check all boxes when the all-on button is clicked
                observeEvent(input$allon, {
                        output$placeholder = renderUI({
                                mk_checkboxes(ns('checkboxes'),
                                              label = label,
                                              choices = choices,
                                              selected = choices)
                        })
                })

                reactive({
                        # --- This approach doesn't allow checkboxes to return
                        #     NULL, which is essential sometimes.
                        # ---
                        # # check: warn users when all items are checked off
                        # validate(need(!is.null(input$checkboxes),
                        #               'Need at least one box checked.'))
                        # req(input$checkboxes)

                        input$checkboxes
                })
        })
}
