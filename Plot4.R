first_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")
first_data$Date <- as.Date(first_data$Date, "%d/%m/%Y")
data <- subset(first_data, Date >= Date1 & Date <= Date2)

data$Global_active_power <- as.numeric(paste(data$Global_active_power))
data$Global_reactive_power <- as.numeric(paste(data$Global_reactive_power))
data$Voltage <- as.numeric(paste(data$Voltage))
data$Time <- strftime(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")
new <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

data$Sub_metering_1 <- as.numeric(paste(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(paste(data$Sub_metering_2))

png(filename = "Plot4.png", width = 480, height = 480, units = "px")
par(mar = c(4,4,4,4), mfrow = c(2,2),bty="o")
with(data, plot(new, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(data, plot(new, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"), xlim = 246)

with(data, plot(new, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(data, lines(new, Sub_metering_1, type = "l", col = "black"))
with(data, lines(new, Sub_metering_2, type = "l", col = "red"))
with(data, lines(new, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), bty = "n", lty = 1, cex = 0.5, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(new, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power"))

dev.off()
