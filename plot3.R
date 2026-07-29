plot3 <- function(){
  powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  powerData$Date <- as.Date(strptime(powerData$Date, format = "%d/%m/%Y"))
  powerData <- powerData[powerData$Date >= as.Date("2007-02-01") & powerData$Date <= as.Date("2007-02-02"),]
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format = "%Y-%m-%d %H:%M:%S")
  
  
  png("plot3.png", width = 480, height = 480)
  plot(powerData$DateTime, powerData$Sub_metering_1, type = "l", ylab = "Enery sub metering")
  lines(powerData$DateTime, powerData$Sub_metering_2, col = "red")
  lines(powerData$DateTime, powerData$Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
  dev.off()
}