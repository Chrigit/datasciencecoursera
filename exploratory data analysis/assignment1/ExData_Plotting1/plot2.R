## load the necessary data
## assume that the data is one directory up...
## ...to not litter git with additional 20MB
## otherwise you would use: 
## fileUrl = https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## download.file(fileUrl, dest = "../household_power_consumption.txt", method = "curl")
## and then the line below 
data <- read.csv("../household_power_consumption.txt", sep =";", na.strings = "?")

## filter only needed rows by date
dates <-c("1/2/2007", "2/2/2007")
graphData <- subset(data, data$Date %in% dates ) 

## generate data for x axis by:
## - concatenating Date and Time column in a list
dt <- strptime(paste(graphData$Date,graphData$Time), "%d/%m/%Y %H:%M:%S")

## open png device
png(filename = "plot2.png")

## plot date-time values against power setting the necessary labels using a line
plot(dt, graphData$Global_active_power, type = "l", xlab ="", ylab ="Global active power (kilowatts)")

## close png device
dev.off()