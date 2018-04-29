## Exploratory Data Analysis: Course Project 1
## Plot 4
## Albert Wang

#note: this script assumes that the current working directory contains the required Electric Power Consumption Data Set (household_power_consumption.txt).

#read in the required data
powerdataall <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
#subset for only 1/2/2007 and 2/2/2007 as required
powerdata <- subset(powerdataall, Date == "1/2/2007" | Date =="2/2/2007")
#remove powerdataall to save space
rm(powerdataall)

#create plot
####

#output png file and close the graphics device
dev.copy(png, file="plot4.png")
dev.off()
#note that the output png file will be located in the current working directory