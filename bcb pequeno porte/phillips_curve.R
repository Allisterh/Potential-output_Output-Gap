#### LOADING DATA

data1 <- read.csv("C:/Users/PIETCON/Documents/Data/EST_prod_pot.csv")
pib_pot <- ts(data1$Yn, start = c(2001,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_cnt.R", local = TRUE)
pib <- ts(pib_dsz$pib, start= c(1996,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_nucleos.R", local = TRUE)
ipca_liv <- aggregate(ts(ipca$ipca_livres_tot, start = c(1996,1), frequency = 12), nfrequency = 4)
ipca <- aggregate(ts(ipca$ipca, start = c(1996,1), frequency = 12), nfrequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_inf_expec.R", local = TRUE)
exp_inf <- ts(ipca_exp_sm$ipca_exp_sm, start = c(2002,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_cambio.R", local = TRUE)
#### Warning messages:
####  1: In read_fun(path = path, sheet_i = sheet, limits = limits, shim = shim,  :
####                    Expecting numeric in C862 / R862C3: got a date
camb <- ts(camb$camb_vend_end, start = c(1953,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_crb.R", local = TRUE)
inf_mun <- ts(crb$crb_brl, start = c(1981,2), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_ic_bcb.R", local = TRUE)
ic <- ts(ic_bcb$icbr, start = c(1998,1), frequency = 4)

setwd("C:/Users/PIETCON/Documents")

#### SETTING DATA

