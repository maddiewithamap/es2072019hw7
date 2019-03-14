#14. Write a function to calculate the ANNUAL (calendar year) mean, median, max and min of all sites that have "San" or "Santa" in their name.


library(data.table)

annual<-function(tabella){
  tabella<-filter(tabella,(str_detect(tabella$`Site Name`, "San|Santa")))
  tabella<-data.table(tabella,year=format(tabella$date,'%Y'))
  tabellay<-tabella[, mean(obs), by = list(site,year)]
  return(tabellay)
}






library(tidyverse, quietly = TRUE) #call the libraries tidyverse and readr
library(stringr, quietly = TRUE)

setwd("C:/Users/scasirati/Desktop/Environmental Data Analysis/Environmental Data Analysis Homework 4/")  #set the directory that cointain the data 
o3.filenames <- list.files("data/ca_ozone", pattern = ".txt") # o3.filenames contains the names of each txt file contained int the folder
o3.filelist <- lapply(o3.filenames, read_delim, delim = "|") #it applies the read_delim function to the files that have the filesnames obtained before. It read the tables considering that each column in the original file is separated by |

names(o3.filelist) <- str_extract(o3.filenames,  ".............")
#[1] "ABCD" #it gives at each element of the list the name of the file txt. in that case I can have access at the file that I want in the list by using this format "o3.filelist$ozone19801984""
o3.filelist

total<-rbindlist(o3.filelist)

total<-data.table(total)
colnames(loc)[2] <- "site"
total<-left_join(total,loc, by = "site")
yearly<-annual(total)
