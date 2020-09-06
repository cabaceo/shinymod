#' @title Plot dendrogram.
#'
#' @description
#' Visualize hierarchical clustered object with different colored clusters and
#' leaf labels.
#'
#' @param hc Object returned by `hclust()`.
#' @param n_clusters Integer. Number of clusters.
#' @param label_size Numeric. Size (default = 0.8) of text labels for the leaves.
#' @param title String. Plot title (default = "Hiearchical Clustering Result").
#' @param subtitle String. Plot subtitle (default = NULL).
#' @param xlab String. Label of the x-axis (default = NULL).
#' @param ylab String. Label of the y-axis (default = NULL).
#' @return A ggplot2 dendrogram.
#' @export
#' @examples
#' data(USArrests)
#' dd = dist(scale(USArrests), method = "euclidean")
#' hc = hclust(dd, method = "ward.D2")
#' plt_dend(hc, 2)
#' plt_dend(hc, 4, label_size = 0.5)
#' plt_dend(hc, 5)
plt_dend = function(hc, n_clusters, label_size = 0.8,
                    title = "Hiearchical Clustering Result", subtitle = NULL,
                    xlab = NULL, ylab = NULL) {

        # set up
        ems_colors = c('#2B364A', '#FFC119', '#0B7D85', '#214242', '#A6A6A6')
        ext_colors = c("#2E9FDF", "#00AFBB", "#E7B800", "#FC4E07")
        all_colors = c(ems_colors, ext_colors)
        if (n_clusters <= length(all_colors)) {
                gp_colors = all_colors[1:n_clusters]
        } else {
                gp_colors = NULL
        }

        # plot
        factoextra::fviz_dend(
                hc,
                k = n_clusters,
                cex = label_size,
                rect = FALSE, # do NOT add rectangle around groups
                horiz = TRUE,
                k_colors = gp_colors,
                color_labels_by_k = TRUE,  # color labels by groups
                main = title,
                sub = subtitle,
                xlab = ifelse(is.null(xlab), '', xlab),
                ylab = ifelse(is.null(ylab), '', ylab)
                )
}
