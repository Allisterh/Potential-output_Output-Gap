#### LOADING DATA

data1 <- read.csv("C:/Users/PIETCON/Documents/Data/EST_prod_pot.csv")
pib_pot <- ts(data1$Yn, start = c(2001,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_cnt.R", local = TRUE)
pib <- ts(pib_dsz$pib, start= c(1996,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_selic.R", local = TRUE)
selic <- ts(selic$selic_var_mes, start = c(1974,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_swap.R", local = TRUE)
swap <- ts(swap$swap360_med, start = c(1995,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_inf_expec.R", local = TRUE)
exp_inf <- ts(ipca_exp_sm$ipca_exp_sm, start = c(2002,1), frequency = 4)

source("C:/Users/PIETCON/Documents/Codes/Bases/base_embi.R", local = TRUE)
embi <- ts(embi$embi_br, start = c(1994,2), frequency = 4)

setwd("C:/Users/PIETCON/Documents")

#### SETTING DATA

t <- seq(as.Date("1974/1/1"), as.Date("2018/9/1"), by = "quarter")

