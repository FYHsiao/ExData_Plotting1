# Read source file (TODO:Retrieve 2/1, 2/2 subData only, not all data...)
dataFile <- "./04_w1_ExData_household_power_consumption.txt"
sourceData <- read.table(dataFile, header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE)

#Retrive 2/1, 2/2 subsetdata from source data
subData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007") ,]

#Data Type conversion: from character to datetime/number
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
subMetering_1 <- as.numeric(subData$Sub_metering_1)
subMetering_2 <- as.numeric(subData$Sub_metering_2)
subMetering_3 <- as.numeric(subData$Sub_metering_3)

#Output Plot3.png 
png("plot3.png", width=480, height=480)
plot(dateTime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dateTime, subMetering_2, type="l", col="red")
lines(dateTime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()