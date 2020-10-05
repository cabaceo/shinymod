#' @title A group of 1 integer input box and 2 dropdown boxes.
#'
#' @description
#' The UI component of the Shiny module for creating one integer input box and
#' below it 2 side-by-side dropdown boxes with choices depending on the value
#' entered into the input box.
#'
#' @usage
#' intbox_n_ddboxes_ui('id', 'label', min = 2, max = 10000000, value = 2)
#' @param id    String. The input slot that will be used to access the value.
#' @param label String (default is NULL). Display label for the input box.
#' @param min Integer (default = 2). Minimal value it takes.
#' @param max Integer (default = 10000000). Maximum value it takes.
#' @param value Integer (default is the same as min). Initial value it takes.
#' @return Must use it together with its counterpart server.
#' @seealso \code{\link{intbox_n_ddboxes_server}} for the server.
#' @export
#' @examples inst/examples/ex-intbox_n_ddboxes.R
intbox_n_ddboxes_ui = function(id, label=NULL, min=2, max=10000000, value=min) {
        ns = NS(id)
        tagList(numericInput(ns("intbox"), label = label,
                             value = value,
                             min = min,
                             max = max,
                             width = '100%'),
                uiOutput(ns('ddboxes')))
}

#' @title Implement 1 integer input box and 2 dropdown boxes together.
#'
#' @description
#' The server component of the Shiny module for creating a integer input box and
#' 2 side-by-side dropdown boxes with choices depending on the value entered
#' into the input box.
#'
#' @param id    String. The input slot that will be used to access the value.
#' @param labels Character vector of display labels for the dropdown boxes.
#' @param choice_part_labels String. Part of the label for the value choices.
#' @param selections Character vector of the value choices for each dropdown box.
#'        All dropdown boxes share the same value choices.
#' @return A module server function that can be called in a reactive env.
#' @seealso \code{\link{intbox_n_ddboxes_ui}} for the UI.
#' @export
#' @examples inst/examples/ex-intbox_n_ddboxes.R

intbox_n_ddboxes_server = function(id, labels = c("x-axis", "y-axis"),
                                  choice_part_labels = 'X',
                                  selections = c("X1", "X2")) {
        # If you want more dropdown boxes, you can easily extend this function
        # by adding more `selectInput()` below.

        moduleServer(id, function(input, output, session) {
                ns = session$ns
                output$ddboxes = renderUI({
                        n = input$intbox
                        val_choices = paste0(choice_part_labels, 1:n)

                        fillRow(selectInput(ns("dd1"), label = labels[1],
                                            choices = val_choices,
                                            selected = selections[1],
                                            width = '100%'),
                                br(),
                                selectInput(ns("dd2"), label = labels[2],
                                            choices = val_choices,
                                            selected = selections[2],
                                            width = '100%'),

                                # each dropdown box takes 40% space
                                # their space in between takes 20% space
                                flex = c(2, 1, 2),

                                # set height to '100%' to prevent the dropdown
                                # boxes from overlapping with the UI element
                                # that comes after
                                height = '100')
                })

                reactive({ list(intbox_val = req(input$intbox),
                                ddbox1_val = req(input$dd1),
                                ddbox2_val = req(input$dd2)) })
        })
}

