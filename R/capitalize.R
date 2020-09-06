#' @title Capitalize the first letter.
#'
#' @description
#' Capitalize the first letter of each element in a character vector.
#' NA elements are returned as NA.
#'
#' @param char_vec A character vector (or a vector of strings).
#' @return A vector of 1st-letter capitalized strings.
#' @export
#' @examples
#' s = c("gmlang", NA, "hello", "Jan", "feb")
#' capitalize(s)
capitalize = function(char_vec) {
        res = sapply(char_vec, function(x) {
                        if (is.na(x)) {
                                return(x)
                        } else {
                                s = strsplit(x, " ")[[1]]
                                paste(toupper(substring(s, 1, 1)),
                                      substring(s, 2), sep="", collapse=" ")
                        }
                })
        setNames(res, NULL)
}

