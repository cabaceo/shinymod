#' @title An awesome run-button.
#'
#' @description
#' Create a pretty run-button that triggers some calculation when clicked.
#' Run-buttons are often used in `observeEvent()`.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Text (default = 'Run') to be shown on the run button.
#' @return A list of HTML elements that can be added to a UI definition.
#' @export
#' @examples inst/examples/ex-run-button.R
mk_run_button = function(id, label = 'Run') {
        shinyWidgets::actionBttn(inputId = id,
                                 label = label,
                                 color = "default",
                                 style = "material-flat",
                                 block = TRUE)
}
