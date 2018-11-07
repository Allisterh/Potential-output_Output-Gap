####### SCRIPT QUE CALCULA O TREND DO PIB POR BEVERIDGE-NELSON #######
# O PACOTE USADO SERÁ O DLM, POIS CONTÉM UMA FUNÇÃO PARA ISSO #
# PAPER USADO COMO BASE: State Space Modeling in Macroeconomics and Finance 
# (http://faculty.washington.edu/ezivot/statespacesurvey.pdf)

modeldlmARMA = function(phi){
  ar = c(phi[1],phi[2]) #vetor com coeficientes autoregressivos
  ma = c(phi[3],phi[4]) #vetor com coeficientes da média móvel
  sigma2 = phi[5] #variância do erro
  modelaux = dlmModARMA(ar = ar, ma = ma, sigma2 = sigma2)
  return(modelaux)
}
MLEestimARMA = dlmMLE(log(Y), parm = c(1,1,1,1,1), build = modeldlmARMA, method = "Nelder-Mead")
fit.kalman.ARMA = dlmFilter(log(Y), mod = modeldlmARMA(MLEestimARMA$par))
Yn.BN = exp(fit.kalman.ARMA$m[-1,1])
