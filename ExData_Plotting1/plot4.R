# A script to recreate the fourth of four graphs for the first assignment of the
# Exploratory Data Analysis course on Coursera offered by Johns Hopkins University.

# Read in the data frame.
power <- read.table("household_power_consumption/power.txt", sep=";", header = TRUE, na.strings="?")

# Select dates (February 1, 2007 to February 2, 2007)
sub_power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

# Convert date
sub_power$DateTime <- strptime(paste(sub_power$Date, sub_power$Time), format="%d/%m/%Y %H:%M:%S")

# (Re)Produce the graph matrix.
png(filename= "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow = c(2, 2))
    # The first graph.
    plot(sub_power$DateTime, sub_power$Global_active_power, type = "l", ylab="Global Active Power", xlab="")

    # The second graph.
    plot(sub_power$DateTime, sub_power$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")

    # The third graph.
    plot(sub_power$DateTime, sub_power$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    lines(sub_power$DateTime, sub_power$Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "Energy sub metering")
    lines(sub_power$DateTime, sub_power$Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "Energy sub metering")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

    # The fourth graph.
    plot(sub_power$DateTime, sub_power$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()