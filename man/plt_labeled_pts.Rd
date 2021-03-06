% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plt_labeled_pts.R
\name{plt_labeled_pts}
\alias{plt_labeled_pts}
\title{Plot scattered labeled points.}
\usage{
plt_labeled_pts(
  df,
  xvar,
  yvar,
  pt_label_var,
  title = "Multidimensional Scaling Result",
  repel_force = 10
)
}
\arguments{
\item{df}{Data frame. Its rows are points and columns are dimensions.}

\item{xvar}{String. Name of the variable to be put on the x-axis.}

\item{yvar}{String. Name of the variable to be put on the y-axis.}

\item{pt_label_var}{String. Name of the variable to label the points.}

\item{title}{String. Plot title (default = "Multidimensional Scaling Result").}

\item{repel_force}{Integer. Force of repulsion between overlapping text
labels. Defaults to 10. If this value is too small, the labels often
won't be repeled hard enough to completely avoid overlapping.}
}
\value{
A ggplot2 scatterplot with labeled points.
}
\description{
Visualize a blob of 2-D data points in space, with nearly non-overlapping
labels for the points.
}
\examples{
mtcars$car_types = row.names(mtcars)
plt_labeled_pts(mtcars, xvar = 'mpg', yvar = 'wt', pt_label_var = 'car_types')
}
