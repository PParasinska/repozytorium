#PACZKI DO PRACY 
library(tidyverse)

#załadowanie danych 
data <- iris

#policz średnią szerokosc petal cały zestaw danych 
srednia <- mean(data[, 4])

#policz mediaę i odchylenie standardowe, druga kolumna i wiersze 10 do 15
mediana <- median(data[10:15,2])
odchylenie <- sd(data[10:15, 2])

#[policz średnią dla gatunku versicolor, zmienna Petal Length
srednia.pl.versicolor <- mean(51:100, 3)

#policz srednia dla gatunku virginica zmienna pierwsza
srednia.pl.virginica <- mean(data[data$Species== "virginica", 1])

#podsumowanie danych 
podsumowanie <- summary(data)

#utworzenie kolumny na podstawie sumy
suma.dwa.i.trzy <- data$Sepal.Width + data[, 3]

#utworzenie kolumny na podstawie sumy - jako nowa zmienna w ramce data 
data$nasza.suma <- data$Sepal.Width + data$Petal.Length

#suma 3 kolumn podzielona przez czwartą
data$dziwne.com <- (data$Sepal.Length + data$Sepal.Width + data$Petal.Length) / data$Petal.Width

#srednia kolumny 1 i 2 jako nowa kolumna (zmienna)
data$srednia.jeden.dwa <- mean(c(data$Sepal.Length, data$Sepal.Width))

#subset (wybór) ramki danych 
data_mniejsza <- data[, 1:5]

#subset ramki, wiersze i kolumny wierszen 40 i 50-60, kolumny 2 i 3
data_mniejsza.2 <- data[c(40, 50:60),c(2:3)]

#Tidyverse, paczka dplyr i funkcja select ####
#wybór z funckji select - wykorzystanie nazwy
#kolumna sepal.width
data.3 <- dplyr::select(data, Sepal.Width)

#negatywne wybory
data.4 <- dplyr::select(data, -Species)

data.5 <- dplyr::select(data, -c(nasza.suma, srednia.jeden.dwa, dziwne.com))

#zmienna pozycji
data.6 <-  dplyr::select(data.5, Species, Petal.Length, Sepal.Length, Sepal.Width, Petal.Width)

#wybór na podstawie początku nazwy 
data.7 <- dplyr::select(data, dplyr::starts_with("petal"))
                        
#wybór na podtsaiwe końca nazwy 
data.8 <-  dplyr::select(data, dplyr::ends_with("length"))
                        
#wybór na podstawie dowolnego dopasowania 
data.9 <-  dplyr::select(data, dplyr::contains("l.L"))

#wybor zakresu 
data.10 <- dplyr::select(data, Sepal.Length:Petal.Length)

#wybór wierszy tidyverse i filter ####
data.11 <- dplyr::filter(data, Petal.Length > 2)

