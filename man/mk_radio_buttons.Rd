% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mk-radio-buttons.R
\name{mk_radio_buttons}
\alias{mk_radio_buttons}
\title{A group of awesome radio buttons.}
\usage{
mk_radio_buttons(id, label = NULL, choices)
}
\arguments{
\item{id}{String. The input slot that will be used to access the value.}

\item{label}{String. Display label/title for the radio buttons group, or
NULL (default) for no label.}

\item{choices}{Character vector. List of values to show radio buttons for.
If elements of the list are named then names rather than values are
displayed. The values should be strings; other types
(such as logicals and numbers) will be coerced to strings.}
}
\value{
A list of HTML elements that can be added to a UI definition.
}
\description{
Create a group of pretty radio buttons used to select an item from a list.
}
\examples{
inst/examples/ex-radio-buttons.R
}
