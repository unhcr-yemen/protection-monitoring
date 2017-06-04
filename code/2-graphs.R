#### Produce graphs
#source("code/1-loaddata.R")


source("code/0-packages.R")
library(koboloadeR)

#########################################################################################
## Produce graphs of all select_one questions
kobo_bar_one(data,dico)

#########################################################################################
## Produce graphs of all select_multiple questions
kobo_bar_multi(data,dico)

########################################################################################
### Produce faceted chart select_one

kobo_bar_one_facet(data,dico)

#########################################################################################
## Produce histogramme for all numeric variable
kobo_histo(data,dico)
