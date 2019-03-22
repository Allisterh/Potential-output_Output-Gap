library(readxl)
library(dplyr)
library(lubridate)
#### PIB IBGE (retirado da MCM)
path_data <- "F:/DADOS/ASSET/MACROECONOMIA/DADOS/Base de Dados/" 
pib <- as.data.frame(read_excel(paste0(path_data,"MCM/PIBTRIM1.xls"), 
                                    sheet="PIB, PNB, Renda Nacional e FBKF", skip=1))


nms <- c("datas", "pib_merc", "rem_emprego", "renda_prop", "rnb", "tranfs", "renda_disp_bruta", "desp_cons", 
         "poupanca", "fbkf", "cessao_ativos_nfin", "transf_capital", "necess_fin_rm")
names(pib) <- nms

pib_tri <- pib[1:(which(pib$datas == "TOTAIS ANUAIS")-1),]
pib_ano <- pib[which(pib$datas == "TOTAIS ANUAIS"):(which(pib$datas == 
   "Nome da Série: Indicadores Econômicos das Contas Nacionais Trimestrais - Em moeda corrente ($ milhões)")-2),]

per <- strsplit(pib_tri$datas, "[.]")
per <- data.frame(ano=sapply(per,'[[',1) %>% as.character %>% as.numeric, 
                  tri=sapply(per,'[[',2) %>% as.character)
per$mes <- NA
per$mes[which(per$tri == "I")] <- 3;   per$mes[which(per$tri == "II")] <- 6
per$mes[which(per$tri == "III")] <- 9; per$mes[which(per$tri == "IV")] <- 12

pib_tri$datas <- as.Date(paste0(per$ano,"-",per$mes,"-01"), format="%Y-%m-%d") %>% as.character