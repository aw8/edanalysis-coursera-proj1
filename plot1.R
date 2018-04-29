## Exploratory Data Analysis: Course Project 1
## Plot 1
## Albert Wang

#note: this script assumes that the current working directory contains the required Electric Power Consumption Data Set (household_power_consumption.txt).

#read in the required data
powerdataall <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
#subset for only 1/2/2007 and 2/2/2007 as required
powerdata <- subset(powerdataall, Date == "1/2/2007" | Date =="2/2/2007")

#create plot
par(mfrow = c(1,1))
with(powerdata, hist(as.numeric(Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))

#output png file and close the graphics device
dev.copy(png, file="plot1.png")
dev.off()
#note: the output png file will be located in the current working directory
