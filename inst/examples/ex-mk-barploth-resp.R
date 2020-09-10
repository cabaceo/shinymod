library(shinymod)

iris$status = ifelse(iris$Sepal.Width > median(iris$Sepal.Width), 'T', 'F')

f = mk_barploth_resp(iris)
glimpse(iris)

f('Sepal.Length', 'Species')
f('Sepal.Length', 'status')
f('Sepal.Length', 'status', fillby = 'Species')
f('Sepal.Length', 'Species', fillby = 'status')



df = ggplot2::diamonds %>% count(clarity) %>% mutate(pct = n / sum(n))
g = mk_barploth_resp(df)
g("n", "clarity", label_decimals = 0)
g("pct", "clarity", label_decimals = 2)
g("pct", "clarity", show_pct = T)
