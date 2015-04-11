# Working Directory has to contain the file household_power_consumption.txt
# 
# Author: wog48
###############################################################################

powerData	<- read.csv("household_power_consumption.txt", sep = ';', colClasses = c("character", "character","character", "character","character", "character","character", "character","character"))
powerData	<- subset(powerData, Date == '1/2/2007' | Date == '2/2/2007')
dateTime	<- paste(powerData[,1], powerData[,2])
dateTime	<- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
powerData	<- cbind(dateTime,powerData)
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)
Sys.setlocale("LC_TIME", "English") 

# Create plot
par(mfrow = c(2,2))
plot(powerData$dateTime, powerData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(powerData$dateTime, powerData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(powerData$dateTime, powerData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines( powerData$dateTime,  powerData$Sub_metering_2, col = 'red')
lines( powerData$dateTime,  powerData$Sub_metering_3, col = 'blue')
legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty = c(1, 1, 1), pch = c(NA, NA, NA))
plot(powerData$dateTime, powerData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.copy(png, file = "plot4.png")
dev.off()
