# plot3.R

# Read in full data set

powerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

# Convert dates and times
powerData$datetimesub <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Subset data for only 2007-02-01 and 2007-02-02
dataSub <- subset(powerData, datetimesub >= "2007-02-01 00:00:00" & datetimesub < "2007-02-03 00:00:00")
dataSub$datetimesub <- as.POSIXct(dataSub$datetimesub)

# create and inspect plot before export to png

plot(dataSub$Sub_metering_1 ~ dataSub$datetimesub, type="l", ylab="Energy sub metering", xlab="")
lines(dataSub$Sub_metering_2 ~ dataSub$datetimesub, type="l", col="red")
lines(dataSub$Sub_metering_3 ~ dataSub$datetimesub, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

# plot line graph to "plot3.png" with pixel (default) dimensions 480 X 480
png("plot3.png", width=480, height=480)
plot(dataSub$Sub_metering_1 ~ dataSub$datetimesub, type="l", ylab="Energy sub metering", xlab="")
lines(dataSub$Sub_metering_2 ~ dataSub$datetimesub, type="l", col="red")
lines(dataSub$Sub_metering_3 ~ dataSub$datetimesub, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()