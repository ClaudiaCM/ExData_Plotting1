## Getting household_power_consumption dataset
full_set <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_set$Date <- as.Date(full_set$Date, format="%d/%m/%Y")

## Subsetting the data
subset_data <- subset(full_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_set)

## Converting date types
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

## Creating Plot 1
hist(subset_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to Plot 1 as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()