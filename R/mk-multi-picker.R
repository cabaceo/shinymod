#' @title A dropdown box where multiple choices can be selected.
#'
#' @description
#' Create a plain dropdown box where multiple choices can be selected. When 1
#' choice is selected, it displays the name of the selected item. When 2 or more
#' choices are selected, it displays the count. It also comes with two buttons
#' that allows people to select all items and unselect all items. In addition,
#' if an item is checked, a check mark will appear next to the item.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Display label/title for the checkboxes group, or
#'        NULL (default) for no label.
#' @param choices Character vector. List of values to show checkboxes for.
#'        If elements of the list are named then names rather than values
#'        are displayed to the user. The values should be strings; other types
#'        (such as logicals and numbers) will be coerced to strings.
#' @param selected The values that should be initially selected, if any.
#'        Default is NULL for no initial selection.
#' @return A list of HTML elements that can be added to a UI definition.
#' @seealso \code{\link{}} for an example of how to use this function.
#' @export
#' @examples inst/examples/ex-multi-picker.R
mk_multi_picker = function(id, label = NULL, choices, selected = NULL) {
        shinyWidgets::pickerInput(
                inputId = id,
                label = htmltools::h4(label),
                choices = choices,
                selected = selected,
                width = '100%',
                options = list(`actions-box` = TRUE, size = 10,
                               `selected-text-format` = "count > 1",
                               `dropup-auto` = FALSE),
                multiple = TRUE)
}
