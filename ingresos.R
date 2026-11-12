eph %>% 
  filter(ano_trim == "2025-IV", CH06 >= 18, ESTADO == 1) %>% 
  group_by(TipodeOcupacionBIS) %>%
  summarise(ingresos = weighted.median(ing_lab, PONDIIO, na.rm = TRUE))

eph %>% 
  filter(ano_trim == "2025-IV", CH06 >= 18, ESTADO == 1) %>% 
  group_by(EMPLEO) %>%
  summarise(ingresos = weighted.median(ing_lab, PONDIIO, na.rm = TRUE))

eph %>% 
  filter(ano_trim == "2025-IV", CH06 >= 18, ESTADO == 1) %>% 
  group_by(TipodeOcupacionBIS) %>%
  summarise(ingresos = weighted.mean(ing_lab, PONDIIO, na.rm = TRUE))

eph %>% 
  filter(ano_trim == "2025-IV", CH06 >= 18, ESTADO == 1) %>% 
  group_by(EMPLEO) %>%
  summarise(ingresos = weighted.mean(ing_lab, PONDIIO, na.rm = TRUE))


eph %>% 
  filter(ano_trim == "2025-IV", CH06 >= 18, ESTADO == 1) %>% 
  group_by(TipodeOcupacionBIS) %>%
  summarise(ingresos = weighted.median(P47T, PONDII, na.rm = TRUE))

eph %>% 
  filter(ano_trim == "2025-IV", CH06 >= 18, ESTADO == 1) %>% 
  group_by(EMPLEO) %>%
  summarise(ingresos = weighted.mean(P21, PONDIIO, na.rm = TRUE))
