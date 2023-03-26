#' @title A group of awesome checkboxes.
#'
#' @description
#' Create a group of pretty checkboxes used to toggle multiple choices
#' independently.
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
#' @seealso \code{\link{checkbox_w_onoff_button_server}} for an example of how
#'          to use this function.
#' @export
#' @examples inst/examples/ex-checkboxes-allon-alloff.R
mk_checkboxes = function(id, label = NULL, choices, selected = NULL) {
        shinyWidgets::prettyCheckboxGroup(
                inputId = id,
                label = htmltools::h4(label),
                choices = choices,
                selected = selected,
                icon = shiny::icon("check-square"),
                outline = TRUE,
                animation = "jelly",
                status = 'warning',
                width = '100%',
                bigger = T
                )
}
