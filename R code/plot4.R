# Reading and subsetting power consumption data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Extracting data from 2007-02-01 to 2007-02-02
subdata <- subset(mydata, mydata$Date== "1/2/2007" | mydata$Date =="2/2/2007")

# Extracting the missing values
globalActivePower <- as.numeric(subdata$Global_active_power)
globalReactivePower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Extracting missing values from submetering data
subMetering1 <- as.numeric(subdata$Sub_metering_1)
subMetering2 <- as.numeric(subdata$Sub_metering_2)
subMetering3 <- as.numeric(subdata$Sub_metering_3)

# Creating png file
png("plot4.png", width=480, height=480)
# initiating a composite plot with many graphs
par(mfrow = c(2, 2)) 

# Calling the basic plot function
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

