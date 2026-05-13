library(tidyverse)
library(lubridate)

canasta_alimentaria <- read.csv("https://infra.datos.gob.ar/catalog/sspm/dataset/445/distribution/445.1/download/canasta-basica-alimentaria-regiones-del-pais.csv")

canasta_total <- read.csv("https://infra.datos.gob.ar/catalog/sspm/dataset/446/distribution/446.1/download/canasta-basica-total-regiones-del-pais.csv")


canasta_alimentaria <- canasta_alimentaria %>%
  mutate(
    indice_tiempo = as.Date(indice_tiempo),
    periodo = paste0(year(indice_tiempo), ".", quarter(indice_tiempo))) %>% 
  pivot_longer(
    cols = c(gran_buenos_aires, cuyo, noreste, noroeste, pampeana, patagonia),
    names_to  = "region",
    values_to = "CBA"
  ) %>% 
  group_by(region, periodo) %>% 
  summarise(CBA = mean(CBA))

canasta_total <- canasta_total %>%
  mutate(
    indice_tiempo = as.Date(indice_tiempo),
    periodo = paste0(year(indice_tiempo), ".", quarter(indice_tiempo))) %>% 
  pivot_longer(
    cols = c(gran_buenos_aires, cuyo, noreste, noroeste, pampeana, patagonia),
    names_to  = "region",
    values_to = "CBT"
  ) %>% 
  group_by(region, periodo) %>% 
  summarise(CBT = mean(CBT))

canastas <- canasta_alimentaria %>% 
  left_join(canasta_total, by = c("region", "periodo")) %>% 
  mutate(codigo = case_when(region == "gran_buenos_aires" ~ 1,
                            region == "noroeste" ~ 40,
                            region == "noreste" ~ 41,
                            region == "cuyo" ~ 42,
                            region == "pampeana" ~ 43,
                            region == "patagonia" ~ 44))

saveRDS(canastas, "fuentes/canastas.rds")
