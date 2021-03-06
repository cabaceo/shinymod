% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radio-buttons.R
\name{radio_buttons_server}
\alias{radio_buttons_server}
\title{Implement a group of radio buttons.}
\usage{
radio_buttons_server(id)
}
\arguments{
\item{id}{String. The input slot that will be used to access the value.}
}
\value{
A module server function that can be called in a reactive env.
}
\description{
The server component of the Shiny module for making a group of radio buttons.
}
\examples{
inst/examples/ex-radio-buttons.R
}
\seealso{
\code{\link{radio_buttons_ui}} for the UI.
}
