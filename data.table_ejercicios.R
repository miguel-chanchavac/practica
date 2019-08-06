#Cambio de ejemplo Github
library(data.table)

#Datatable ejercicio
class(iris)
DTiris <- as.data.table(iris)
class(DTiris)
head(DTiris)
DTiris[,.(
  Sepal.Length.media = mean(Sepal.Length),
  Sepal.Width.media = mean(Sepal.Width),
  Petal.Length.media = mean(Petal.Length),
  Petal.Width.media = mean(Petal.Width))]

DTiris[,.(
  Sepal.Length.media = mean(Sepal.Length),
  Sepal.Width.media = mean(Sepal.Width),
  Petal.Length.media = mean(Petal.Length),
  Petal.Width.media = mean(Petal.Width)),
  by = Species]


?data.table

#Usando .SD
DTiris[, lapply(.SD, mean), by = Species]
head(DTiris)

#Usando .SDcols
DTiris[, lapply(.SD, mean), by = Species, .SDcols = c(1,2)]
DTiris[, lapply(.SD, mean), by = Species, .SDcols = c("Sepal.Length","Sepal.Width")]

#Crear columna nueva por referencia
DTiris[Sepal.Length > 5, Sepal.Length.Tam := "Grande"]
DTiris[Sepal.Length <= 5, Sepal.Length.Tam := "Peq"]

#Borrar por referenia
DTiris[,Sepal.Length.Tam := NULL]
