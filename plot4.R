## Exploratory Data Analysis: Course Project 1
## Plot 4
## Albert Wang

#note: this script assumes that the current working directory contains the required Electric Power Consumption Data Set (household_power_consumption.txt).

#read in the required data
powerdataall <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
#subset for only 1/2/2007 and 2/2/2007 as required
powerdata <- subset(powerdataall, Date == "1/2/2007" | Date =="2/2/2007")

#first, fix the dates
powerdata$Date <- paste(powerdata$Date, powerdata$Time)
powerdata <- select(powerdata, -Time)
powerdata <- rename(powerdata, DateTime = Date)
powerdata$DateTime <- strptime(powerdata$DateTime, format="%d/%m/%Y %H:%M:%S")

#draw plot
par(mfcol = c(2,2))

##graph1
with(powerdata, plot(x=DateTime, y=Global_active_power, type="l", xlab="Date/Time", ylab="Global Active Power (kilowatts)"))

##graph2
#submetering 1
with(powerdata, plot(x=DateTime, y=Sub_metering_1, type="l", xlab="Date/Time", ylab="Energy Sub Metering"))
#submetering 2
with(powerdata, points(x=DateTime, y=Sub_metering_2, type="l", col="red"))
#submetering 3
with(powerdata, points(x=DateTime, y=Sub_metering_3, type="l", col="blue"))
#legend
legend("topright", lty=c(1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "blue", "red"), bty="n")

##graph3
with(powerdata, plot(x=DateTime, y=Voltage, type="l", xlab="Date/Time", ylab="Voltage"))

##graph4
with(powerdata, plot(x=DateTime, y=Global_reactive_power, type="l", xlab="Date/Time", ylab="Global Reactive Power"))

#output png file and close the graphics device
dev.copy(png, file="plot4.png")
dev.off()
#note: the output png file will be located in the current working directory