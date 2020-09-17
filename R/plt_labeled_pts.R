#' @title Plot scattered labeled points.
#'
#' @description
#' Visualize a blob of 2-D data points in space, with nearly non-overlapping
#' labels for the points.
#'
#' @param df Data frame. Its rows are points and columns are dimensions.
#' @param xvar String. Name of the variable to be put on the x-axis.
#' @param yvar String. Name of the variable to be put on the y-axis.
#' @param pt_label_var String. Name of the variable to label the points.
#' @param repel_force  Integer. Force of repulsion between overlapping text
#'        labels. Defaults to 10. If this value is too small, the labels often
#'        won't be repeled hard enough to completely avoid overlapping.
#' @param title String. Plot title (default = "Multidimensional Scaling Result").
#' @return A ggplot2 scatterplot with labeled points.
#' @export
#' @examples
#' mtcars$car_types = row.names(mtcars)
#' plt_labeled_pts(mtcars, xvar = 'mpg', yvar = 'wt', pt_label_var = 'car_types')
plt_labeled_pts = function(df, xvar, yvar, pt_label_var,
                           title = "Multidimensional Scaling Result",
                           repel_force = 10) {
        p = ggplot(df, aes_string(xvar, yvar)) +
                theme_classic() +
                theme(axis.text.x = element_blank(),  # remove x-axis text
                      axis.text.y = element_blank(), # remove y-axis text
                      axis.ticks = element_blank()  # remove axis ticks
                      ) +
                labs(x = "", y = "", title = title) +
                guides(fill = FALSE) +
                geom_point() +
                ggrepel::geom_text_repel(aes_string(label = pt_label_var),
                                         color = blues9[8], max.iter = 3000,
                                         force = repel_force, seed = 404)

        square_fig(p)
}
