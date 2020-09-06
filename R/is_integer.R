#' @title Integer Numbers
#'
#' @description
#' Given a vector, check if its values are integers or not. Base R lacks a
#' function for checking if a value is an integer or not. So we have to write
#' our own.
#'
#' @param x. A vector of any type.
#' @return  A logical vector of the same length as `x`, indicating which
#' elements are integers and which are not.
#' @export
#' @examples
#' is_integer(c(NA_integer_, NA_complex_, NA_real_, NA_character_))
#' is_integer(c(-9, 9, -9.2, 1L))
#' is_integer(c(NaN, Inf, -Inf))
#' all(is_integer(iris[[4]]))
#' all(is_integer(mtcars[[2]]))
is_integer = function(xs) {
        sapply(xs, function(x) {
                switch(typeof(x),
                       integer = TRUE,
                       double = if (is.na(x) | is.infinite(x)) { FALSE }
                                else if (abs(x-round(x)) <
                                         .Machine$double.eps^0.5) { TRUE }
                                else { FALSE },
                       FALSE)
        }) %>% setNames(nm = NULL)
}
