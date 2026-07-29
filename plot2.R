plot2 <- function(){
  powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  powerData$Date <- as.Date(strptime(powerData$Date, format = "%d/%m/%Y")) 
  powerData <- powerData[powerData$Date >= as.Date("2007-02-01") & powerData$Date <= as.Date("2007-02-02"),]
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format = "%Y-%m-%d %H:%M:%S")
  
  png("plot2.png", width = 480, height = 480)
  plot(powerData$DateTime, powerData$Global_active_power, type = 'l')
  dev.off()
}