# plot2.R

# Read in full data set

powerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

# Convert dates and times
powerData$datetimesub <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Subset data for only 2007-02-01 and 2007-02-02
dataSub <- subset(powerData, datetimesub >= "2007-02-01 00:00:00" & datetimesub < "2007-02-03 00:00:00")
dataSub$datetimesub <- as.POSIXct(dataSub$datetimesub)
     
# create and inspect plot before export to png

plot(dataSub$Global_active_power ~ dataSub$datetimesub, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")

# plot line graph to "plot2.png" with pixel (default) dimensions 480 X 480
png("plot2.png", width=480, height=480)
plot(dataSub$Global_active_power ~ dataSub$datetimesub, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()