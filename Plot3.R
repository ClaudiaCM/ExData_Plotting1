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

## Creating Plot 3
with(subset_data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving the file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()