rm(list = ls())
################################################################
## Load all required packages
source("code/0-packages.R")


### Double Check that you have the last version
#source("https://raw.githubusercontent.com/Edouard-Legoupil/koboloadeR/master/inst/script/install_github.R")
#install.packages("devtools")
#library("devtools")
#install_github("Edouard-Legoupil/koboloadeR")

library(koboloadeR)

## kobo_projectinit()
##################################################################
## load all samples
##################################################################
data.or <- read.csv("data/datanew.csv")

### Need to replace slash by point in the variable name
#data.or <- kobo_arrange_variablename(data.or)

## get variable name from data
datalabel <- as.data.frame( names(data.or))
names(datalabel)[1] <- "nameor"
datalabel$nameor <- as.character(datalabel$nameor)

## new variables name without /
datalabel$namenew <- str_replace_all(datalabel$nameor, ":", ".")
## let's recode the variable of the dataset using short label - column 3 of my reviewed labels
names(data.or) <- datalabel[, 2]
rm(datalabel)
##############################################
## Load form
rm(form)
form <- "form4.xls"
## Generate & Load dictionnary
kobo_dico(form)
dico <- read.csv(paste("data/dico_",form,".csv",sep=""), encoding="UTF-8", na.strings="")
rm(form)

#################################################################################
##### Re-encode correctly the dataset
#str(data.or)
data.or$Info.GovernorateID   <- as.character(data.or$Info.GovernorateID )
data.or$Info.DistrictID  <- as.character(data.or$Info.DistrictID )
data.or$Info.Loc   <- as.character(data.or$Info.Loc )

data.or$G1.HA.HA1.TopPriorities_1  <- as.character(data.or$G1.HA.HA1.TopPriorities_1)
data.or$G1.HA.HA1.TopPriorities_2  <- as.character(data.or$G1.HA.HA1.TopPriorities_2)
data.or$G1.HA.HA1.TopPriorities_3  <- as.character(data.or$G1.HA.HA1.TopPriorities_3)

#str(data.or$G1.HA.HA1.TopPriorities_1)

#str(dico)
#data <- kobo_encode(data.or, dico)
#data <- kobo_encode(dataall, dico)
#data <- kobo_label(data, dico)

#########################################################
## need to Splits select_multiple variables
data <- kobo_split_multiple(data.or, dico)
data <- kobo_encode(data, dico)
data <- kobo_label(data, dico)
write.csv(data,"data/data2.csv")

#str(data$G1.HA.HA1.TopPriorities_1)
#names(data)
#str(data$G1.HA.HA1.TopPriorities_1)

