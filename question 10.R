
#10. Identify the number of sites that do not have a complete address (full street address and zip code).

checkaddress<-function(tabella) {
address<-str_count(tabella$Address,"\\d+\\s\\w")
address[address>=2]=1
address[address==0]=NA
zipcode<-str_count(tabella$Address,"\\d{5}")
zipcode[zipcode==0]=NA
complete<-address*zipcode
number<-dim(loc)[1]-sum(complete,na.rm=T)  
number

print(paste(number, " of sites doesn't have the a complete address"))
}

setwd("C:/Users/scasirati/Desktop/Environmental Data Analysis/Environmental Data Analysis Homework 4/") 
loc <- read_excel("data/ca_ozone/location.xls")
loc
checkaddress(loc)