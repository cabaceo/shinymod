library(shinymod)

iris$status = ifelse(iris$Sepal.Width > median(iris$Sepal.Width), 'T', 'F')

f = mk_barploth_resp(iris)
glimpse(iris)

f('Sepal.Length', 'Species')
f('Sepal.Length', 'status')
f('Sepal.Length', 'status', fillby = 'Species')
f('Sepal.Length', 'Species', fillby = 'status')
