#' @title Run button.
#'
#' @description
#' Create a run button that triggers some calculation when clicked. Run buttons
#' are often used in `observeEvent()`.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Text (default = 'Run') to be shown on the run button.
#' @return A list of HTML elements that can be added to a UI definition.
#' @export
#' @examples inst/examples/ex-run-button.R
mk_run_button = function(id, label = 'Run') {
        tagList(shinyWidgets::actionBttn(inputId = id,
                                         label = label,
                                         color = "success",
                                         style = "material-flat",
                                         block = TRUE),
                htmltools::br() # insert a line break
                )
}
