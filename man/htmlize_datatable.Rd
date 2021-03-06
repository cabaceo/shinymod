% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/htmlize.R
\name{htmlize_datatable}
\alias{htmlize_datatable}
\title{HTMLize data tables}
\usage{
htmlize_datatable(
  df,
  type = "basic",
  digits = 2,
  add_bttns = FALSE,
  new_width = "50px",
  ...
)
}
\arguments{
\item{df}{Data frame. The data to be displayed.}

\item{type}{String. Either 'basic' (default) or 'fancy'. Basic type removes
pagination, search box and information. It only shows the data table
as a plain HTML table. Fancy type keeps all these features and in
addition allows you to change the width of all the columns at once.}

\item{digits}{Integer. The number of digits (default = 2) to show after the
decimal point for only the columns with decimal values, not the ones
with all integer values.}

\item{add_bttns}{Logical. If TRUE, add three buttons ('Copy', 'Print' and
'Download') to the displayed data table. Default is FALSE.}

\item{new_width}{String or integer. New width of all the columns. Default
is '50px'. You can also supply an integer instead of a string (for
example, 50 instead of '50px').}

\item{...}{Other parameters (such as rownames = F) that can be passed into
`DT::datatable()`.}
}
\value{
A `DT::datatable()` object, which can be rendered under
        `DT::renderDataTable()` and by default will show rownames.
}
\description{
Add HTML styling to better display data tables.
}
\examples{
htmlize_datatable(iris, type = 'basic', digits = 1, rownames = F)
htmlize_datatable(iris, type = 'basic', digits = 1, rownames = paste0('AA', 1:nrow(iris)))
htmlize_datatable(iris, type = 'fancy', digits = 1, add_bttns = TRUE)
htmlize_datatable(iris, type = 'fancy', digits = 1, new_width = 25)
}
