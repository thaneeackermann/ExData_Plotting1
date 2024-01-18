# Download data set from coursera
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "electricpowerconsumption.zip")

# Unzip file
unzip("electricpowerconsumption.zip")

# Import data from txt file
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Subset data from the dates 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Plot the histogram plot
hist(data[ , 3], col = "red", xlab = "Global Active Power (kilowatts", ylab = "Frequency", main = "Global Active Power")

# Save histogram to a PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width = 480, height = 480)
dev.off()