plot1 <- function(){
  powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  powerData$Date <- as.Date(strptime(powerData$Date, format = "%d/%m/%Y"))
  powerData <- powerData[powerData$Date >= as.Date("2007-02-01") & powerData$Date <= as.Date("2007-02-02"),]
  
  png("plot1.png", width = 480, height = 480)
  hist(powerData$Global_active_power, col = "red")
  dev.off()
}