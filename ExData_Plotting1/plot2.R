# A script to recreate the second of four graphs for the first assignment of the
# Exploratory Data Analysis course on Coursera offered by Johns Hopkins University.

# Read in the data frame.
power <- read.table("household_power_consumption/power.txt", sep=";", header = TRUE, na.strings="?")

# Select dates (February 1, 2007 to February 2, 2007)
sub_power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

# Convert date
sub_power$DateTime <- strptime(paste(sub_power$Date, sub_power$Time), format="%d/%m/%Y %H:%M:%S")

# (Re)Produce the line graph.
png(filename= "plot2.png", width = 480, height = 480, bg = "transparent")
plot(sub_power$DateTime, sub_power$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()