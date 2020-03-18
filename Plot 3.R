########################################
## ASSIGNMENT
########################################

rm(list=ls())
setwd("C:/Documents/ExData_Plotting1")

##libraries
library(readr)
library(dplyr)
library(tidyr)
library(lubridate)

#import data
hpc <- read_delim("household_power_consumption.txt", 
                  ";", escape_double = FALSE, trim_ws = TRUE)
#convert date from string to date format
hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")

#restrict dataset
hpc<-hpc %>% filter(Date==dmy("01/02/2007") | Date== dmy("02/02/2007") )

#combine date and time
hpc$DateTime<- as.POSIXct(paste(hpc$Date, hpc$Time,sep= " "))

#plot 3
plot( hpc$Sub_metering_1 ~ hpc$DateTime, type="l", ylab="Energy sub metering", xlab="")
lines( hpc$DateTime,hpc$Sub_metering_2, col="red")
lines( hpc$DateTime,hpc$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))


#save to png
dev.copy(png, width=480,height=480,file = "plot 3.png")
dev.off()

