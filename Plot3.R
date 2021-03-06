first_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")
first_data$Date <- as.Date(first_data$Date, "%d/%m/%Y")
data <- subset(first_data, Date >= Date1 & Date <= Date2)

data$Sub_metering_1 <- as.numeric(paste(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(paste(data$Sub_metering_2))
data$Time <- strftime(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")
new <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "Plot3.png", width = 480, height = 480, units = "px")
with(data, plot(new, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(data, lines(new, Sub_metering_1, type = "l", col = "black"))
with(data, lines(new, Sub_metering_2, type = "l", col = "red"))
with(data, lines(new, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"),lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()