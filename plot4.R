# Read source file (TODO:Retrieve 2/1, 2/2 subData only, not all data...)
dataFile <- "./04_w1_ExData_household_power_consumption.txt"
sourceData <- read.table(dataFile, header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE)

#Retrive 2/1, 2/2 subsetdata from source data
subData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007") ,]

#Data Type conversion: from character to datetime/number
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
subMetering_1 <- as.numeric(subData$Sub_metering_1)
subMetering_2 <- as.numeric(subData$Sub_metering_2)
subMetering_3 <- as.numeric(subData$Sub_metering_3)

#Output Plot4.png (devided into 4 slots)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))     # A vector of the form c(nr, nc). Subsequent figures will be drawn in an nr-by-nc array on the device by columns (mfcol), or rows (mfrow), respectively.
  
  # (-1, 1)
  plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

  # (1,1)
  plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

  # (-1, -1)
  plot(dateTime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(dateTime, subMetering_2, type="l", col="red")
  lines(dateTime, subMetering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2, col=c("black", "red", "blue"), bty="o")

  # (-1, 1)
  plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()