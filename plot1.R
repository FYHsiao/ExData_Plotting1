# Read source file (TODO:Retrieve 2/1, 2/2 subData only, not all data...)
dataFile <- "./04_w1_ExData_household_power_consumption.txt"
sourceData <- read.table(dataFile, header=TRUE, sep=";",dec=".", stringsAsFactors=FALSE)

#Retrive 2/1, 2/2 subsetdata from source data
subData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007") ,]

#Data Type conversion: from character to number
globalActivePower <- as.numeric(subData$Global_active_power)

#Show plot on Screen
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Output Plot1.png 
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


