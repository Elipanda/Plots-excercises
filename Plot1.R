first_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")
first_data$Date <- as.Date(first_data$Date, "%d/%m/%Y")
data <- subset(first_data, Date >= Date1 & Date <= Date2)

data$Global_active_power <- as.numeric(paste(data$Global_active_power))
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", xlim = range(0,6))
dev.off()


