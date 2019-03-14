library(tidyverse)
library(readxl)

sansanta<-function(tabella){

colnames(tabella)[2] <- "site"
san_santa<-str_count(str_to_lower(tabella$`Site Name`), "san")
san_santa[san_santa==2]=1
tot<-sum(san_santa)
santa<-(str_count(str_to_lower(tabella$`Site Name`), "santa"))
santa[san_santa==2]=1
tot2<-sum(santa)

print(paste("in the Site name dataset there are ",tot-tot2," sites with san and", tot2, "site with santa"))
}

setwd("C:/Users/scasirati/Desktop/Environmental Data Analysis/Environmental Data Analysis Homework 4/") 
loc <- read_excel("data/ca_ozone/location.xls")
loc
sansanta(loc)