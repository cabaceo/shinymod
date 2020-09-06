#' @title Are all elements of a vector integers?
#'
#' @description Check if a vector has all integer elements.
#'
#' @param xs A vector of any type.
#' @return Return TRUE if all elements of a given vector are integers,
#'         FALSE otherwise.
#' @export
#' @examples
#' all_ints(iris[[4]])
#' all_ints(mtcars[[2]])
#' unique(mtcars[[2]])
#' str(mtcars[[2]])
all_ints = function(xs) {
        for (x in xs) if (!is_integer(x)) return(FALSE)
        TRUE
}

#' @title Check if a value is an integer or not.
#'
#' @description
#' Base R lacks a function for checking if a value is an integer or not. This
#' function does that.
#'
#' @param x. A value of any type.
#' @return Returns TRUE or FALSE.
#' @export
#' @examples
#' is_integer(NA_integer_)
#' is_integer(NA_complex_)
#' is_integer(NA_real_)
#' is_integer(NA_character_)
#' is_integer(-9)
#' is_integer(9)
#' is_integer(-9.2)
#' is_integer(12)
#' is_integer(NaN)
#' is_integer(Inf)
#' is_integer(-Inf)
is_integer = function(x) {
        switch(typeof(x),
               integer = TRUE,
               double = if (is.na(x) | is.infinite(x)) FALSE
                        else if (abs(x-round(x)) < .Machine$double.eps^0.5) TRUE
                        else FALSE,
               FALSE
        )
}
