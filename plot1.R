# plot1.R

# Read in full data set

powerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

# Convert dates

powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")

# Subset data for only 2007-02-01 and 2007-02-02

dataSub <- subset(powerData, Date == "2007-02-01" | Date == "2007-02-02")

# create and inspect plot before export to png

hist(dataSub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# plot histogram to "plot1.png" with pixel (default) dimensions 480 X 480
png("plot1.png", width=480, height=480)
hist(dataSub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
