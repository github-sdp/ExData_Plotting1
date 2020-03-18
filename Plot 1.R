########################################
## ASSIGNMENT
###############################

rm(list=ls())
setwd("C:/Documents/ExData_Plotting1")

##libraries
library(readr)
library(dplyr)
library(tidyr)
library(lubridate)

##import data
hpc <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)
#convert date to date format
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")

#restrict dataset
hpc<-hpc %>% filter(Date==dmy("01/02/2007") | Date== dmy("02/02/2007") )

#combine date and time
hpc$DateTime<- as.POSIXct(paste(hpc$Date, hpc$Time,sep= " "))


#plot1
hist(hpc$Global_active_power, col="red", main="Global active power", xlab="Global Active Power (kilowatts)")

#save to png
dev.copy(png, width=480,height=480,file = "plot1.png")
dev.off()
          
          