#' @title A group of awesome radio buttons.
#'
#' @description
#' Create a group of pretty radio buttons used to select an item from a list.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Display label/title for the radio buttons group, or
#'        NULL (default) for no label.
#' @param choices Character vector. List of values to show radio buttons for.
#'        If elements of the list are named then names rather than values are
#'        displayed. The values should be strings; other types
#'        (such as logicals and numbers) will be coerced to strings.
#' @return A list of HTML elements that can be added to a UI definition.
#' @export
#' @examples inst/examples/ex-radio-buttons.R
mk_radio_buttons = function(id, label = NULL, choices) {
        shinyWidgets::awesomeRadio(id,
                                   label = label,
                                   choices = choices,
                                   selected = choices[1],
                                   status = 'warning',
                                   width = '100%')
}
