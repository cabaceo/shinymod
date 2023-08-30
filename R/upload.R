#' @title Upload button.
#'
#' @description
#' The UI component of the Shiny module for creating a pretty upload button
#' for uploading a text file.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Text (default = "Select a text file (< 30MB)") to be
#'        shown on the upload button.
#' @return Must use it together with its counterpart server.
#' @seealso \code{\link{upload_server}} for the server.
#' @export
#' @examples inst/examples/ex-upload.R
upload_ui = function(id, label = "Select a text file (< 30MB)") {
        ns = NS(id)
        tagList(
                fileInput(ns("file"), h4(label),
                          accept = c("text/comma-separated-values, text/plain",
                                     "text/csv", ".csv", ".txt"),
                          width = '100%'),
                shinyWidgets::awesomeCheckbox(ns("heading"), "Has header row",
                                              value = T, status = 'warning'),
                shinyWidgets::awesomeRadio(ns("sep"), "Delimiter",
                                           choices = c(Comma = ',',
                                                       Semicolon = ';',
                                                       Tab = '\t'),
                                           status = 'warning')
                )
}

#' @title Implement the upload button.
#'
#' @description
#' The server component of the Shiny module for creating a pretty upload button
#' for uploading a text file.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @return A module server function that can be called in a reactive env to
#'         read the user-uploaded file and return a data frame.
#' @seealso \code{\link{upload_ui}} for the UI.
#' @export
#' @examples inst/examples/ex-upload.R
upload_server = function(id) {
        moduleServer(id, function(input, output, session) {
                ns = session$ns
                user_file = reactive({ req(input$file) })
                reactive({
                        df = readr::read_delim(user_file()$datapath,
                                               delim = input$sep,
                                               col_names = input$heading)
                        # names(df) = gsub('\x92', '', names(df)) # https://blog.r-project.org/2022/06/27/why-to-avoid-%5Cx-in-regular-expressions/index.html
                        df
                })
        })
}
