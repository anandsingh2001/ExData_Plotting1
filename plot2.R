df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
subset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
subset$datetime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S")
subset$datetime <- as.POSIXct(subset$datetime)
plot(subset$Global_active_power ~ subset$datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()