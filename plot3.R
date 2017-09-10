df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
subset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
subset$datetime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S")
subset$datetime <- as.POSIXct(subset$datetime)
plot(subset$Sub_metering_1 ~ subset$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(subset$Sub_metering_2 ~ subset$datetime, col = "Red")
lines(subset$Sub_metering_3 ~ subset$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()