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

## open png device
png(filename = "plot1.png")

## generate a histogram
hist(graphData$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global Active Power")

## close png device
dev.off()