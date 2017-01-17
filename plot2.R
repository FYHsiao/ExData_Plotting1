# Read source file
dataFile <- "./04_w1_ExData_household_power_consumption.txt"
sourceData <- read.table(dataFile, header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE)

#Retrive 2/1, 2/2 subsetdata from source data
subData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007") ,]

#Data Type conversion: from character to datetime/number
dateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

#Show plot on Screen
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Output Plot2.png 
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()