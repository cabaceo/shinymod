#' @title A plain dropdown box.
#'
#' @description
#' Create a plain dropdown box where only one value can be selected.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Display label/title for the dropdown box, or
#'        NULL (default) for no label.
#' @param choices Character vector. List of values listed under the dropdown box
#'        for user to select. If elements of the list are named then that name
#'        rather than the value is displayed. The values should be strings;
#'        other types (such as logicals and numbers) will be coerced to strings.
#' @return A list of HTML elements that can be added to a UI definition.
#' @seealso \code{\link{dropdown_box_ui}} for an example of how to use it.
#' @export
#' @examples inst/examples/ex-dropdown-box.R
mk_dropdown_box = function(id, label = NULL, choices) {
        selectInput(id, label = htmltools::h4(label),
                    choices = choices,
                    selected = choices[1],
                    width = '100%')
}
