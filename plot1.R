# Working Directory has to contain the file household_power_consumption.txt
# 
# Author: wog48
###############################################################################

# Load relevant data 
powerData	<- read.csv("household_power_consumption.txt", sep = ';', colClasses = c("character", "character","character", "character","character", "character","character", "character","character"))
powerData	<- subset(powerData, Date == '1/2/2007' | Date == '2/2/2007')
dateTime	<- paste(powerData[,1], powerData[,2])
dateTime	<- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
powerData	<- cbind(dateTime,powerData)
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)
Sys.setlocale("LC_TIME", "English") 

# Create plot
hist(powerData$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()