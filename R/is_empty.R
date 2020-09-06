#' @title Check if a vecotr is empty or not.
#'
#' @description
#' There's no function in base R that checks if a vector is empty or not.
#' The function is.null() doesn't always work, for example,
#'     is.null(c()) returns TRUE (correct), but
#'     is.null(vector()) returns FALSE (incorrect),
#'     is.null(numeric(0)) returns FALSE (incorrect),
#'     is.null(integer(0)) returns FALSE (incorrect),
#'     is.null(character(0)) returns FALSE (incorrect).
#' A non-empty vector, after removing each of its elements, will become a vector
#' of length 0. So we can check if a vector is empty by its length. If its
#' length is 0, then it's empty.
#'
#' @param xs A vector of any type.
#' @return   TRUE if the vector is empty, FALSE otherwise.
#' @export
#' @examples
#' is_empty(vector()) # vector() is the same as logical()
#' is_empty(numeric())
#' is_empty(integer())
#' is_empty(character())
#' is_empty(c())
is_empty = function(xs) length(xs) == 0
