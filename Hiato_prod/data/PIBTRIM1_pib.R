library(readxl)
library(dplyr)
library(lubridate)
#### PIB IBGE (retirado da MCM)
path_data <- "F:/DADOS/ASSET/MACROECONOMIA/DADOS/Base de Dados/" 
pib_dsz <- as.data.frame(read_excel(paste0(path_data,"MCM/PIBTRIM1.xls"), 
                                    sheet="Série Encadeada - Dessaz", skip=3))

names <- c("datas", "val_add", "imp_liq", "pib_merc", "agro_tot", "ind_tot", "ind_ext_min", "ind_trans", 
           "ind_cons_civ", "ind_energ", "serv_tot", "serv_com", "serv_transp", "serv_info", "serv_fin",
           "serv_outros", "serv_imob", "serv_adm_pub", "cons_fam", "cons_gov", "fbkf", "exp", "imp")
names(pib_dsz) <- names

pib_tri_dsz <- pib_dsz[1:(which(pib_dsz$datas == "MÉDIAS ANUAIS")-1),]
pib_ano_dsz <- pib_dsz[which(pib_dsz$datas == "MÉDIAS ANUAIS"):(which(pib_dsz$datas == 
   "Nome da Série: Produto Interno Bruto Trimestral por Setor de Atividade - Série Encadeada - Dados Originais")-2),]

per <- strsplit(pib_tri_dsz$datas, "[.]")
per <- data.frame(ano=sapply(per,'[[',1) %>% as.character %>% as.numeric, 
                  tri=sapply(per,'[[',2) %>% as.character)
per$mes <- NA
per$mes[which(per$tri == "I")] <- 3;   per$mes[which(per$tri == "II")] <- 6
per$mes[which(per$tri == "III")] <- 9; per$mes[which(per$tri == "IV")] <- 12

pib_tri_dsz$datas <- as.Date(paste0(per$ano,"-", per$mes,"-01")) %>% as.character
