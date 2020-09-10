#' @title Download button.
#'
#' @description
#' The UI component of the Shiny module for creating a pretty download button
#' for downloading a csv, png, or jpg file.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Text (default = 'Download') to be shown on the download
#'        button.
#' @return Must use it together with its counterpart server.
#' @seealso \code{\link{download_server}} for the server.
#' @export
#' @examples inst/examples/ex-download.R
download_ui = function(id, label = "Download") {
        ns = NS(id)
        shinyWidgets::downloadBttn(ns("download"), label = label,
                                   style = "jelly", color = "default")
}

#' @title Implement the download button.
#'
#' @description
#' The server component of the Shiny module for creating a pretty download
#' button for downloading a csv, png, or jpg file.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param obj   The object to be saved. Either a data frame or a ggplot2 object.
#' @param fname String. Name of the file under which to save the object.
#' @param ftype String. Type of the file to save. One of three values:
#'              'csv' (default), 'png', 'jpg'.
#' @param ...   Arguments that can be passed into `ggplot2::ggsave()`. For
#'        example `dpi` (image resolution), `width`, and `height`.
#' @return A module server function that can be called in a reactive env.
#' @seealso \code{\link{download_ui}} for the UI.
#' @export
#' @examples inst/examples/ex-download.R
download_server = function(id, obj, fname = 'download', ftype = 'csv', ...) {
        stopifnot("`ftype` must be one of 'csv', 'png' or 'jpg'." =
                          ftype %in% c('csv', 'png', 'jpg'))
        moduleServer(id, function(input, output, session) {
                ns = session$ns
                output$download = downloadHandler(
                        filename = function() paste(fname, ftype, sep='.'),
                        content = function(file) {
                                if (ftype == 'csv') {
                                        readr::write_csv(obj, file)
                                } else {
                                        ggplot2::ggsave(file, plot = obj, ...)
                                }
                        })
        })
}

#' @title Implement the download button for a base plot.
#'
#' @description
#' The server component of the Shiny module for creating a pretty download
#' button for downloading a base plot as a png file.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param obj   The object to be saved. Either a data frame or a ggplot2 object.
#' @param fname String. Name of the file under which to save the object.
#' @param dpi   Number. The resolution of the saved png file. Default = 156.
#' @param ...   Arguments that can be passed into `grDevices::png()`. For
#'        example, `units`, `width` and `height`.
#' @return A module server function that can be called in a reactive env.
#' @seealso \code{\link{download_ui}} for the UI.
#' @export
#' @examples inst/examples/ex-download.R
download_baseplot_server = function(id, obj, fname = 'download', dpi=156, ...) {
        moduleServer(id, function(input, output, session) {
                ns = session$ns
                output$download = downloadHandler(
                        filename = function() paste0(fname, ".png"),
                        content = function(file) {
                                grDevices::png(file, res=dpi, ...)
                                obj
                                dev.off()
                        }
                )
        })
}
