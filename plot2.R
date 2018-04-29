## Exploratory Data Analysis: Course Project 1
## Plot 2
## Albert Wang

#note: this script assumes that the current working directory contains the required Electric Power Consumption Data Set (household_power_consumption.txt).
#note: this script also uses library "dplyr", ensure that it is installed.
library(dplyr)

#read in the required data
powerdataall <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
#subset for only 1/2/2007 and 2/2/2007 as required
powerdata <- subset(powerdataall, Date == "1/2/2007" | Date =="2/2/2007")
#remove powerdataall to save space
rm(powerdataall)

#first, fix the dates
powerdata$Date <- paste(powerdata$Date, powerdata$Time)
powerdata <- select(powerdata, -Time)
powerdata <- rename(powerdata, DateTime = Date)
powerdata$DateTime <- strptime(powerdata$DateTime, format="%d/%m/%Y %H:%M:%S")

#draw plot
with(powerdata, plot(x=DateTime, y=Global_active_power, type="l", xlab="Date/Time", ylab="Global Active Power (kilowatts)"))

#output png file and close the graphics device
dev.copy(png, file="plot2.png")
dev.off()
#note: the output png file will be located in the current working directory