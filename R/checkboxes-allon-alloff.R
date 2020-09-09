#' @title A group of checkboxes with all-on/all-off control buttons.
#'
#' @description
#' The UI component of the Shiny module for creating a group of pretty
#' checkboxes with an all-on and an all-off control buttons.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param bttn_height Integer. It controls the space below the all-on/all-off
#'        buttons. The bigger the value (default = 60), the more space there is.
#'        Without it (or when its value is too small), it can happen that the
#'        all-on and all-off buttons will overlap with whatever UI elements
#'        that are placed right below them.
#' @return Must use it together with its counterpart server.
#' @seealso \code{\link{checkboxes_allon_alloff_server}} for the server.
#' @export
#' @examples inst/examples/ex-checkboxes-allon-alloff.R
checkboxes_allon_alloff_ui = function(id, bttn_height = 60) {
        ns = NS(id)
        tagList(
                # placeholder for checkboxes. We cannot place the checkboxes
                # here directly since they need to be controled by clicking the
                # all-on/all-off buttons, so we need to place the implementation
                # of the checkboxes inside the server.
                uiOutput(ns("placeholder")),

                # all-on and all-off buttons
                fillRow(shinyWidgets::actionBttn(ns("allon"), "All On",
                                                 color = "default"),
                        shinyWidgets::actionBttn(ns("alloff"), "All Off",
                                                 color = "warning"),
                        flex = c(3, 7), # first button takes up 30% space
                        height = bttn_height)
        )
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
#' @return A module server function that can be called in a reactive env.
#' @seealso \code{\link{checkboxes_allon_alloff_ui}} for the UI, and
#'          \code{\link{mk_checkboxes}} for how the group checkboxes are made.
#' @export
#' @examples inst/examples/ex-checkboxes-allon-alloff.R
checkboxes_allon_alloff_server = function(id, label = NULL, choices) {
        moduleServer(id, function(input, output, session) {
                ns = session$ns

                # first, we display the checkboxes all checked
                output$placeholder = renderUI({
                        mk_checkboxes(ns('checkboxes'),
                                      label = label,
                                      choices = choices,
                                      selected = choices)
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
                        # check: warn users when all items are checked off
                        validate(need(!is.null(input$checkboxes),
                                      'Need at least one box checked.'))
                        req(input$checkboxes)
                })
        })
}
