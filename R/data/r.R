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

#DODAJ STAŁĄ DO KOLUMNY 
data <- data |> 
  #dodaj 1
  dplyr::mutate(Petal.Length=Petal.Length+1)
  
#Dodaj kolumnę sepal.length - petal length i policz pierwiaste z sepal width
data <-  data |>  
  dplyr::mutate(roznica=Sepal.Length- Petal.Length, Sepal.Width= sqrt(Sepal.Width))

#policzyć logarytm z czterech pierwszych kolumn 
data <- data |> 
  dplyr::mutate(dplyr::across(dplyr::ends_with("th"), \ (a) log10(a)))

#wczytaj dane jeszcze raz
data_2 <- iris
# operacja na wszystkich kolumnach ktore sa numeryczne
data_2 <-  data_2 |> 
  dplyr::mutate(dplyr::across(dplyr::where(\(x)is.numeric(x)),\(a)a^2))

#wczytaj dane
data_3 <- iris

#zlogarytmuj te kolumny gdzie minimum jest większe od 1 
data_3 <- data_3 |> 
  dplyr::mutate(across(where(\(y) is.numeric(y) && min(y)>1),\(z) log2(z)))

#wykonaj operacje i zmien lokalizacje
data_4 <- data_3 |> 
  dplyr::mutate(kolumna_1=Petal.Length+1, .before = Petal.Length)

#wykonaj operację i porzuź kolumny 
data_5 <- data_3 |> 
  dplyr::mutate(kolumna=Petal.Length-500, .keep="none")

#zmiana pozycji kolumny bez mutate
data_6 <- data_3 |> 
  dplyr::relocate(Petal.Length, .after = Sepal.Length)

# wczytaj dane jeszcze raz
data_7 <- iris
#tidyr - zmiana formatu ramki

data_7 <- data_7 |> 
  dplyr::mutate(id=1:length(Sepal.Length))

#zmiana formatu
data_long <- data_7 |> 
  tidyr::pivot_wider(id_cols = id, names_from = Species, values_from = Sepal.Length:Petal.Width)

