#' @title A plain single dropdown box.
#'
#' @description
#' The UI component of the Shiny module for creating a plain single dropdown
#' box.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Display label/title for the dropdown box, or
#'        NULL (default) for no label.
#' @param choices Character vector. List of values listed under the dropdown box
#'        for user to select. If elements of the list are named then that name
#'        rather than the value is displayed. The values should be strings;
#'        other types (such as logicals and numbers) will be coerced to strings.
#' @return Must use it together with its counterpart server.
#' @seealso \code{\link{dropdown_box_server}} for the server
#'          \code{\link{mk_dropdown_box}} for how to make a plain dropdown box.
#' @export
#' @examples inst/examples/ex-dropdown-box.R
dropdown_box_ui = function(id, label = NULL, choices) {
        ns = NS(id)
        mk_dropdown_box(ns('ddbox'), label = label, choices = choices)
}

#' @title Implement a single dropdown box.
#'
#' @description
#' The server component of the Shiny module for creating a single dropdown box.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @return A module server function that can be called in a reactive env.
#' @seealso \code{\link{dropdown_box_ui}} for the UI.
#' @export
#' @examples inst/examples/ex-dropdown-box.R
dropdown_box_server = function(id) {
        moduleServer(id, function(input, output, session) {
                ns = session$ns
                reactive({ req(input$ddbox) })
        })
}
