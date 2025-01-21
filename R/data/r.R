#paczki 
library(tidyverse)
data <- iris

#nowa kolumna podziel sepal length przez speal width
data$iloraz <- (data$Sepal.Length/data$Sepal.Width)

#TWORZENIE i operacje na istniejących kolumnach mutate 
data <- data |> 
  #funkcja mutate 
  dplyr::mutate(iloraz_2= Sepal.Length/Sepal.Width)

#operacje na istniejacej kolumnie
#logarytm naturalny z petal.length
data <- data |> 
  #log z p.l
  dplyr::mutate(Petal.Length=log(Petal.Length))
