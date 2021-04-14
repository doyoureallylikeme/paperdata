# Do you really like me?

This repository contains the data and the script necessary to obtain the parameters and the quality indices for the paper `do you really like me'.

## Getting Started

In order to replicate the study, 5 files are needed:

- data_lv.csv: the dataset associated to the online forum *La Vanguardia*
- data_pf.csv: the dataset associated to the online forum *The politics forum*
- data_ts.csv: the dataset associated to the online forum *The Sun*
- r_code.txt: the R script 
- sem_model.txt: the SEM model described in the paper

### Prerequisites

In order to use the data, the R software is needed. Additionally, the libraries *sem* and *dplyr* must be installed

### Checking the results

The script 'r_code.txt' is quite simple, it just loads the data and applies the model:

```
library(sem)
library(dplyr)

data <- read.csv("data_lv.csv")


data<-select(data,conv_insultos,long_media_debates_com, num_conv_likes_otras,num_conv_likes_com,num_debates_otra,num_debates_com,long_media_debates_otra)
opt <- options(fit.indices = c("GFI", "AGFI", "RMSEA", "NFI", "NNFI", "CFI", "RNI", "IFI", "SRMR", "AIC", "AICc", "BIC", "CAIC"))

model <- specifyModel("sem_model.txt")
covar <- cov(data)
S <- sem(model, covar, nrow(data))
summary(S)


```

The output includes the information shown in the paper

```
Model Chisquare =  8.944489   Df =  8 Pr(>Chisq) = 0.3470004
 Goodness-of-fit index =  0.9973564
 Adjusted goodness-of-fit index =  0.9907473
 RMSEA index =  0.01106088   90% CI: (NA, 0.04037595)
 Bentler-Bonett NFI =  0.9918158
 Tucker-Lewis NNFI =  0.997687
 Bentler CFI =  0.9991189
 Bentler RNI =  0.9991189
 Bollen IFI =  0.9991294
 SRMR =  0.02257955
 AIC =  48.94449
 AICc =  9.833378
 BIC =  -46.04082
 CAIC =  -54.04082

 Normalized Residuals
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-1.90658 -0.38762 -0.07742 -0.09544  0.08336  1.79396 

 R-square for Endogenous Variables
          conv_insultos  long_media_debates_com    num_conv_likes_otras      num_conv_likes_com        num_debates_otra 
                 0.0000                  2.5405                  1.5416                  0.0872                  0.2922 
        num_debates_com long_media_debates_otra 
                 0.0487                  1.3053 

 Parameter Estimates
                           Estimate      Std Error    z value    Pr(>|z|)                                                          
InOut_badWords              9.382878e-05 5.272358e-04  0.1779636  8.587516e-01 conv_insultos <--- InOut                            
InOut_depthDebatesCom       1.039368e-02 5.404468e-03  1.9231647  5.445936e-02 long_media_debates_com <--- InOut                   
InOut_likesOther           -4.008661e-01 1.364985e-01 -2.9367794  3.316399e-03 num_conv_likes_otras <--- InOut                     
InOut_likesCom             -9.292255e-02 3.293599e-02 -2.8213074  4.782835e-03 num_conv_likes_com <--- InOut                       
InOut_debatesOther          8.911186e-03 3.766318e-03  2.3660205  1.798045e-02 num_debates_otra <--- InOut                         
InOut_debatesCom            4.464457e-03 2.210221e-03  2.0199145  4.339225e-02 num_debates_com <--- InOut                          
In_likesCom                -1.052050e-02 6.448793e-03 -1.6313900  1.028081e-01 num_conv_likes_com <--- In                          
In_debatesCom               1.215267e-02 3.094728e-03  3.9268952  8.604945e-05 num_debates_com <--- In                             
In_depthDebatesCom          2.851261e-01 5.811729e-02  4.9060462  9.293066e-07 long_media_debates_com <--- In                      
Out_likesOther             -4.200417e-02 8.820162e-03 -4.7622900  1.914083e-06 num_conv_likes_otras <--- Out                       
Out_debatesOther            4.716795e-02 3.429362e-03 13.7541489  4.809068e-43 num_debates_otra <--- Out                           
Out_dephDebatesOther        2.717480e-01 1.331645e-02 20.4069412  1.450850e-92 long_media_debates_otra <--- Out    
```
These results are for the forum 'La Vanguardia'. For the rest of the examples, please change in the script

```
data <- read.csv("data_lv.csv")
```
by either


```
data <- read.csv("data_pf.csv")
```
or
```
data <- read.csv("data_ts.csv")
```
