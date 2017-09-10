df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
subset <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
hist(subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()