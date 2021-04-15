# Do you really like me?

This repository contains the data and the script necessary to obtain the parameters and the quality indices for the paper `do you really like me'.

## Getting Started

In order to replicate the study, 5 files are needed:

- data_lv.csv: the dataset associated to the online forum *La Vanguardia*
- data_pf.csv: the dataset associated to the online forum *The politics forum*
- data_ts.csv: the dataset associated to the online forum *The Sun*
- r_code.R: the R script 
- sem_model.txt: the SEM model described in the paper

### Prerequisites

In order to use the data, the R software is needed. Additionally, the libraries *sem* and *dplyr* must be installed in R:

```
install.packages("dplyr")
install.packages("sem")
```

### Checking the results

The script 'r_code.R' is quite simple, it just loads the data and applies the model to the three datasets. The output includes the information shown in the paper
