setwd("/Users/emma/Desktop/Learning/4. Exploratory data analysis/datasciencecoursera-exploratory1")

unzip("exdata_data_household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = T, sep = ";")

#Subset data
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")


#Convert Date and Time columns to new column with date/time class
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Convert character variables to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Create plot 3
with(data,plot(DateTime, Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = ""))
points(x = data$DateTime, y = data$Sub_metering_1, type = "l")
points(x = data$DateTime, y = data$Sub_metering_2, type = "l", col = "red")
points(x = data$DateTime, y = data$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Create PNG file
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
