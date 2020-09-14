#' @title An awesome slider.
#'
#' @description
#' Create a pretty slider that takes input from the user as they slide it.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param label String. Text label of the slider (default = 'Slider Input').
#' @return A list of HTML elements that can be added to a UI definition.
#' @export
#' @examples inst/examples/ex-mk-slider.R
mk_slider = function(id, label = 'Slider Input', ...) {

        # customized css ('warning'-colored background, bigger box and etc)
        style = htmltools::tags$style(type = "text/css",
        ".irs-bar {width: 100%; height: 25px; background: #f0ad4e; border-top: 1px solid black; border-bottom: 1px solid black;}
         .irs-bar-edge {background: #f0ad4e; border-top: 1px solid black; border-bottom: 1px solid black; border-left: 1px solid black; height: 25px; border-radius: 0px; width: 20px;}
         .irs-line {border: 1px solid black; height: 25px; border-radius: 0px;}
         .irs-grid-text {font-family: 'open sans'; font-size:12px; color: white; bottom: 17px; z-index: 1;}
         .irs-grid-pol {display: none;}
         .irs-single {background:#f0ad4e}
         .irs-slider {width: 30px; height: 30px; top: 22px;}")

        htmltools::tagList(style,
                           wellPanel(sliderInput(id, label = label, ...))
                           )
}
