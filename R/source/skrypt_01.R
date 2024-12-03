#Skrypt dzien pierwszy
#zaladuj biblioteki/paczki
library(tidyverse)

#dane z internetu
dane_internet <- readr::read_csv("https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#dane z dysku - sciezka bezwzgledna
dane_dysk_01 <- readr::read_csv("C:/GitHub/repozytorium/R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#dane z dysku - sciezka wzgledne
dane_dysk_02 <- readr::read_csv("R/data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#zmiana kolumny tekst na liczbe
dane_dysk_02$Value <- as.numeric(dane_dysk_02$Value)

#parsowanie tekstu na liczbe
dane_dysk_01$Value <- readr::parse_number(dane_dysk_01$Value)

#sprawdzenie wiersza 748
dane_internet[748,"Value"]
