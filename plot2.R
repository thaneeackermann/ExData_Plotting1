# Download data set from coursera
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electricpowerconsumption.zip")

# Unzip file
unzip("electricpowerconsumption.zip")

# Import data from txt file
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert "Date" and "Time" variables to "Date" and "Time" class
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Create a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width = 480, height = 480)

# Create plot2 and remove x axis values (xaxt = "n")
plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

# Create a new x axis with the labels "Thu", "Fri" and "Sat"
axis(side = 1, at = c(as.numeric(data$Datetime[1]), as.numeric(data$Datetime[1441]),as.numeric(data$Datetime[2880])), labels = c("Thu", "Fri", "Sat"))

# Save it to the PNG file and close device
dev.off()
