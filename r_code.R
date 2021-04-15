library(sem)
library(dplyr)

generateModel = function(fich) {
  data <- read.csv(fich)
  # only some columns are needed
  data<-select(data,badWords,depthDebatesCom, likesOther,likesCom,debatesOther,debatesCom,dephDebatesOther)
  # indexes to check the statistical significance  
  opt <- options(fit.indices = c("GFI", "AGFI", "RMSEA", "NFI", "NNFI", "CFI", "RNI", "IFI", "SRMR", "AIC", "AICc", "BIC", "CAIC"))
  # generate model
  model <- specifyModel("sem_model.txt")
  covar <- cov(data)
  S <- sem(model, covar, nrow(data))
  # show summary
  summary(S)
}

### main program
print("La Vanguardia")
generateModel("data_lv.csv")
print("The Sun")
generateModel("data_ts.csv")
print("The politics forum")
generateModel("data_pf.csv")
