# BRDT (Binomial Reliability Demonstration Tests)

## Description
This package provides the Bayesian methods to get the optimal test sample size in binomial RDT design .
* Binomial RDT (b_.R): This is the conventional test design using failure count data and assuming binomial failure distributions over the testing period.

## Reference
This is the R package implementation for the design methods of binomial reliabiltiy demonstration tests (BRDTs) with failure count data. The original work is from one of the research projects listed on [Suiyao Chen's Homepage](https://sites.google.com/mail.usf.edu/suiyaochen-professional/publication?authuser=0). 

## Installation
To install from Github:
```
devtools::install_github("ericchen12377/BRDT")
#build vignettes if needed
devtools::install_github("ericchen12377/BRDT", build_vignettes = TRUE, force = TRUE)
library(BRDT)
#view vignettes
browseVignettes('BRDT')
```
## Examples
```
######Binomial RDT Design######
###Generate the prior distribution of failure probability
##Beta is conjugate prior to binomial distribution
#Get the non-informative prior Beta(1, 1)
pi <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)

#Get the consumer's risk
n = 10
R = 0.8
c = 2
b_CR <- bconsumerrisk(n = n, c = c, pi = pi, R = R)
print(b_CR)
#         [,1]
#>[1,] 0.3330482

##As n increases, CR decreases
#Get the optimal test sample size
thres_CR = 0.05 #CR < 0.05
b_n <- boptimal_n(c = c, pi = pi, R = R, thres_CR = thres_CR)
print(b_n)
#>[1,] 24

```
```

## [Updates](NEWS.md)
* Version logs are provided.
