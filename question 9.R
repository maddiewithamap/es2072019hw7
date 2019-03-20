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

#set working drive at beginning of code as a regular step. This can help with context from the file names
#and understanding where the data is coming from
#add comments to tell user what your steps do- the variable names are nice and concise, but without context
#may not be helpful
#for example, I know what tabella has in it because we all had the same assignment, but another user would
#need more information if they wanted to use it or manipulate it into something different.

#The code is nice and streamline and aesthetically pleasing
#Nice print statement