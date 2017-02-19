first_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")
first_data$Date <- as.Date(first_data$Date, "%d/%m/%Y")
data <- subset(first_data, Date >= Date1 & Date <= Date2)

data$Global_active_power <- as.numeric(paste(data$Global_active_power))
data$Time <- strftime(strptime(data$Time, "%H:%M:%S"), "%H:%M:%S")
new <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(filename = "Plot2.png", width = 480, height = 480, units = "px")
with(data, plot(new, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()




