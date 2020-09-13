#' @title Add html styling to page or section title.
#'
#' @description
#' Make the title bigger, emphasized and blue colored.
#'
#' @param title String. Title of a page or a section.
#' @param type  String. Either 'page' (default) or 'section'.
#' @return HTML code wrapped around the input title.
#' @export
#' @examples
#' htmlize_title("This app is designed for Line Optimization", type = 'page')
#' htmlize_title("Simulate Tab", type = 'section')
htmlize_title = function(title, type = 'page') {
        text_color = "color: #214242"
        if (type == 'page')
                htmltools::h1(htmltools::em(title, style = text_color))
        else if (type == 'section')
                htmltools::h3(title, style = text_color)
        else {
                stop("`type` must be 'page' or 'section'")
        }
}

#' @title Insert line breaks between text.
#'
#' @description
#' Feed this function however many lines of strings you want, and it'll insert
#' a line break between every two consecutive lines.
#'
#' @param ... One or more strings.
#' @return HTML code wrapped around the input text.
#' @export
#' @examples
#' s1 = 'Hi, my name is GM. How are you?'
#' s2 = "I'm fine. Thank you, and yourself?"
#' s3 = "I'm doing super. Nice meeting you."
#' htmlize_w_linebreaks(s1, s2, s3)
htmlize_w_linebreaks = function(...)
        htmltools::HTML(paste(list(...), collapse = '<br/>'))

#' @title Creat an unordered list (with bullet points) of texts.
#'
#' @description
#' Feed this function however many lines of strings you want, and it'll itemize
#' them into a bullet-pointed list.
#'
#' @param ... One or more strings.
#' @return HTML code wrapped around the input text.
#' @export
#' @examples
#' s1 = 'Hi, my name is GM. How are you?'
#' s2 = "I'm fine. Thank you, and yourself?"
#' s3 = "I'm doing super. Nice meeting you."
#' htmlize_uoli(s1, s2, s3)
htmlize_uoli = function(...) {
        body = paste(list(...), collapse = '</li><li>')
        htmltools::HTML(paste('<li>', body, '</li>'))
}

#' @title HTMLize data tables
#'
#' @description
#' Add HTML styling to better display data tables.
#'
#' @param df   Data frame. The data to be displayed.
#' @param type String. Either 'basic' (default) or 'fancy'. Basic type removes
#'        pagination, search box and information. It only shows the data table
#'        as a plain HTML table. Fancy type keeps all these features and in
#'        addition allows you to change the width of all the columns at once.
#' @param digits Integer. The number of digits (default = 2) to show after the
#'        decimal point for only the columns with decimal values, not the ones
#'        with all integer values.
#' @param add_bttns Logical. If TRUE, add three buttons ('Copy', 'Print' and
#'        'Download') to the displayed data table. Default is FALSE.
#' @param new_width String or integer. New width of all the columns. Default
#'        is '50px'. You can also supply an integer like 90. It only works if
#'        you want to widen the columns. If you provide a value that's less than
#'        the current width of the columns, the columns won't get narrower.
#' @return A `DT::datatable()` object, which can be rendered under
#'         `DT::renderDataTable()`.
#' @export
#' @examples
#' htmlize_datatable(iris, type = 'basic', digits = 1)
#' htmlize_datatable(iris, type = 'fancy', digits = 1, add_bttns = TRUE)
htmlize_datatable = function(df, type = 'basic', digits = 2,
                             add_bttns = FALSE, new_width = '50px') {

        # set up table configs
        if (add_bttns) {
                dbttn_config = list(extend = 'collection',
                                    buttons = c('csv', 'excel', 'pdf'),
                                    text = 'Download')
                bttns_config = list('copy', 'print', dbttn_config)
        } else { bttns_config = list() }

        cols_config = list(list(targets = '_all', # apply to all cols
                                width = new_width,
                                scrollX = TRUE,
                                # center cell values
                                className = 'dt-center'))

        # find all columns of decimal values so that we can format them to only
        # show 3 decimal places. It doesn't make sense to do this for integers.
        num_vars = names(df)[sapply(df, function(x) class(x) == "numeric")]
        if (is_empty(num_vars)) {
                dec_vars = NULL
        } else {
                has_decs = sapply(num_vars, function(vnm) !all(is_integer(df[[vnm]])))
                dec_vars = num_vars[has_decs]
        }

        # apply the configs
        if (type == 'basic') {
                res = DT::datatable(df, rownames = FALSE, extensions='Buttons',
                                    options = list(dom = 'Bfrtip',
                                                   buttons = bttns_config,
                                                   columnDefs = cols_config,
                                                   paging = F, searching = F,
                                                   info = F))
        } else {
                res = DT::datatable(df, rownames = FALSE, extensions='Buttons',
                                    options = list(dom = 'Bfrtip',
                                                   buttons = bttns_config,
                                                   columnDefs = cols_config,
                                                   pageLength = 10,
                                                   autoWidth = TRUE))
        }

        if (is_empty(dec_vars)) {
                res
        } else { # make decimal values 3 digits
                DT::formatRound(res, columns = dec_vars, digits = digits)
        }
}

#' @title Multiple Linebreaks
#'
#' @description
#' Creates n linebreaks.
#'
#' @param n   Integer. The number of line breaks to make.
#' @return HTML code of n linebreaks.
#' @export
#' @examples
#' linebreaks(5)
linebreaks = function(n) htmltools::HTML(strrep(br(), n))

