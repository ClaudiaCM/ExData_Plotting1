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

## Creating Plot 2
plot(subset_data$Global_active_power~subset_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()