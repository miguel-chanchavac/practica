install.packages("data.table")
library(data.table)
?mtcars
class(mtcars)
DTmtcars <- as.data.table(mtcars)
class(DTmtcars)
DTmtcars[mpg >15,
         .(Media_hp = mean(hp),
           Media_wt = mean(wt)),
         by = cyl]

DT <- data.table(A = 1:5, B = c("a","b","c"), C = rnorm(5), D = FALSE)
DT[1:2]
DT[1:2,3:4]
DT[,C]
DT[,c("A","B")]
#para contar
DT[,.N]
DT[,.N, by = B]
DT[,.N, by = c("A","B")]

#Encadenamiento (chaining)
a <- DT[,.N, by = c("A","B")]
a[order(B)]

DT[,.N, by = c("A","B")][order(B)]
