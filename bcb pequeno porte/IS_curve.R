#### LOADING DATA

data1 <- read.csv("C:/Users/PIETCON/Documents/Data/EST_prod_pot.csv")
pib_pot <- ts(data1$Yn, start = c(2001,1), frequency = 4)

data2 <- read.csv("C:/Users/PIETCON/Documents/Data/EST_prod_pot_mundo.csv")
pmi_pot_mun <- ts(data2$Yn, start = c(2001,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_cnt.R", local = TRUE)
pib <- ts(pib_dsz$pib, start= c(1996,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_pmi.R", local = TRUE)
###### Warning messages:
######  1: In as.numeric(pmi[, i]) : NAs introduced by coercion
######  2: In eval(ei, envir) : NAs introduced by coercion
######  3: In eval(ei, envir) : NAs introduced by coercion
######  4: In eval(ei, envir) : NAs introduced by coercion
######  5: In eval(ei, envir) : NAs introduced by coercion
pmi <- ts(pmi$pmi_global, start= c(1998,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_selic.R", local = TRUE)
selic <- ts(selic$selic_var_mes, start = c(1974,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_nucleos.R", local = TRUE)
ipca <- aggregate(ts(ipca$ipca, start = c(1996,1), frequency = 12), nfrequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_swap.R", local = TRUE)
swap <- ts(swap$swap360_med, start = c(1995,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_cambio_real.R", local = TRUE)
camb <- ts(camb_real$cambr_ipa, start = c(1994,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_fgv.R", local = TRUE)
conf <- ts(conf$ind_conf_dsz, start = c(2001,1), frequency = 4)

setwd("C:/Users/PIETCON/Documents")

#### SETTING DATA

t <- seq(as.Date("1974/1/1"), as.Date("2018/9/1"), by = "quarter")

hiato <- pib - pib_pot
hiato_m <- pmi - pmi_pot_mun
jr_real <- selic - ipca
incl_jr <- log(1 + swap/100) - log(1 + selic/100)

#df <- as.data.frame(na.omit(cbind(t, pib_pot, pmi_pot_mun, pib, pmi, selic, ipca, swap, camb)))
df <- as.data.frame(na.omit(t, hiato, hiato_m))