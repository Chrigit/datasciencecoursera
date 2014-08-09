## load the necessary data
## assume that the data is one directory up...
## ...to not litter git with additional 20MB
## otherwise you would use: 
## fileUrl = https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## download.file(fileUrl, dest = "../household_power_consumption.txt", method = "curl")
## and then the line below 
data <- read.csv("../household_power_consumption.txt", sep =";", na.strings = "?")

#########################################################
#general section
#########################################################

## filter only needed rows by date
dates <-c("1/2/2007", "2/2/2007")
graphData <- subset(data, data$Date %in% dates ) 

# prepare 2x2 "plots per page" plus correct margins
par(mfcol = c(2,2))

#########################################################
#upper left plot
#########################################################
## generate data for x axis by:
## - concatenating Date and Time column in a list
dt <- strptime(paste(graphData$Date,graphData$Time), "%d/%m/%Y %H:%M:%S")

## plot date-time values against power setting the necessary labels using a line
plot(dt, graphData$Global_active_power, type = "l", xlab ="", ylab ="Glabal active power (kilowatts)")

#########################################################
#lower left plot
#########################################################
## plot date-time values against sub_metering1 adding the necessary labels using a line
plot(dt, graphData$Sub_metering_1, type = "l", xlab ="", ylab ="Energy sub metering")

## add lines for submetering 2 and 3 in the required colors
lines(dt, graphData$Sub_metering_2, col = "red")
lines(dt, graphData$Sub_metering_3, col = "blue")

## add the legend
legend("topright",lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#########################################################
#upper right plot
#########################################################
plot(dt, graphData$Voltage,  type = "l", xlab ="datetime", ylab ="Voltage")

#########################################################
#lower right plot
#########################################################
plot(dt, graphData$Global_reactive_power,  type = "l", xlab ="datetime", ylab ="Global_reactive_power")