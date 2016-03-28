# plot4.R

# Read in full data set

powerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

# Convert dates and times
powerData$datetimesub <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Subset data for only 2007-02-01 and 2007-02-02
dataSub <- subset(powerData, datetimesub >= "2007-02-01 00:00:00" & datetimesub < "2007-02-03 00:00:00")
dataSub$datetimesub <- as.POSIXct(dataSub$datetimesub)

# create and inspect plot before export to png
par(mfrow = c(2, 2)) 
plot(dataSub$Global_active_power ~ dataSub$datetimesub, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

plot(dataSub$Voltage ~ dataSub$datetimesub, type="l", ylab="Voltage", xlab="dateime")

plot(dataSub$Sub_metering_1 ~ dataSub$datetimesub, type="l", ylab="Energy sub metering", xlab="")
lines(dataSub$Sub_metering_2 ~ dataSub$datetimesub, type="l", col="red")
lines(dataSub$Sub_metering_3 ~ dataSub$datetimesub, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(dataSub$Global_reactive_power ~ dataSub$datetimesub, type="l", ylab="Global_reactive_power", xlab="dateime")

# plot line graph to "plot4.png" with pixel (default) dimensions 480 X 480
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dataSub$Global_active_power ~ dataSub$datetimesub, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

plot(dataSub$Voltage ~ dataSub$datetimesub, type="l", ylab="Voltage", xlab="datetime")

plot(dataSub$Sub_metering_1 ~ dataSub$datetimesub, type="l", ylab="Energy sub metering", xlab="")
lines(dataSub$Sub_metering_2 ~ dataSub$datetimesub, type="l", col="red")
lines(dataSub$Sub_metering_3 ~ dataSub$datetimesub, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(dataSub$Global_reactive_power ~ dataSub$datetimesub, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
