#15. Write a function to caculate the annual daily mean (what is the annual mean of the daily mean?). Apply that function to Merced County. What is the annual daily mean of o3 for Merced County? Report your results in quantititive format (i.e., prose, or a table), and in visual format (i.e., a graph).


dailymean<-function(raggruppa){
  raggruppa<-filter(raggruppa,(str_detect(raggruppa$`County Name`, "Merced")))
  raggruppa<-data.table(raggruppa, year=format(raggruppa$date,'%Y'))
  tabella<-raggruppa[, mean(V1), by = "year"]
  return(tabella)
}







library(data.table)
library(tidyverse, quietly = TRUE) #call the libraries tidyverse and readr
library(readr, quietly = TRUE)
library(dplyr)
library(data.table)
library(tidyverse, quietly = TRUE) #call the libraries tidyverse and readr
library(readr, quietly = TRUE)
library(dplyr)
setwd("C:/Users/scasirati/Desktop/Environmental Data Analysis/Environmental Data Analysis Homework 4/") 
o3.filenames <- list.files("data/ca_ozone", pattern = ".txt") #o3.filenames contains the names of each txt file contained int the folder "data/ozone"
o3.filenames

setwd("C:/Users/scasirati/Desktop/Environmental Data Analysis/Environmental Data Analysis Homework 4/data/ca_ozone") #set the directory that cointain the data 
o3.filelist <- lapply(o3.filenames, read_delim, delim = "|") #it applies the read_delim function to the files that have the filesnames obtained before. It read the tables considering that each column in the original file is separated by |

names(o3.filelist) <- gsub(".txt","", o3.filenames) #it gives at each element of the list the name of the file txt. in that case I can have access at the file that I want in the list by using this format "o3.filelist$ozone19801984""
o3.filelist
total<-rbindlist(o3.filelist)
total<-data.table(total)


library(readxl)
library(knitr)

setwd("C:/Users/scasirati/Desktop/Environmental Data Analysis/Environmental Data Analysis Homework 4/")
loc <- read_excel("data/ca_ozone/location.xls")
loc
colnames(loc)[2] <- "site"

group1<-total[, mean(obs), by = list(site,date)]
group2<-left_join(group1,loc, by = "site")

dailym<-dailymean(group2)

colnames(dailym)[2]<-"annual mean"
kable(dailym, caption = "Annual daily mean of Merced County")

ggplot(data = dailym) +
  geom_point(mapping=aes(x=dailym$year, y=dailym$`annual mean`)) + labs(x=" year", y="annual mean") + theme(text = element_text(size=8),
                                                                                                            axis.text.x = element_text(angle=90, hjust=1))