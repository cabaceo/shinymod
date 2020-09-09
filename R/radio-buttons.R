#' @title A group of pretty radio buttons.
#'
#' @description
#' The UI component of the Shiny module for creating a group of pretty radio
#' buttons for selecting one value among a list of values.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Display label/title for the radio buttons group, or
#'        NULL (default) for no label.
#' @param choices Character vector. List of values to show radio buttons for.
#'        If elements of the list are named then names rather than values are
#'        displayed. The values should be strings; other types
#'        (such as logicals and numbers) will be coerced to strings.
#' @return Must use it together with its counterpart server.
#' @seealso \code{\link{radio_buttons_server}} for the server
#'          \code{\link{mk_radio_buttons}} for how to make a group of awesome
#'          radio buttons.
#' @export
#' @examples inst/examples/ex-radio-buttons.R
radio_buttons_ui = function(id, label = NULL, choices) {
        ns = NS(id)
        mk_radio_buttons(ns('radios'), label = label, choices = choices)
}

#' @title Implement a group of radio buttons.
#'
#' @description
#' The server component of the Shiny module for making a group of radio buttons.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @return A module server function that can be called in a reactive env.
#' @seealso \code{\link{radio_buttons_ui}} for the UI.
#' @export
#' @examples inst/examples/ex-radio-buttons.R
radio_buttons_server = function(id) {
        moduleServer(id, function(input, output, session) {
                ns = session$ns
                reactive({ req(input$radios) })
        })
}
