# Reading and subsetting power consumption data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Extracting data from 2007-02-01 to 2007-02-02
subdata <- subset(mydata, mydata$Date== "1/2/2007" | mydata$Date =="2/2/2007")

# Extracting the missing values
globalActivePower <- as.numeric(subdata$Global_active_power)

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Creating png file
png("plot2.png", width=480, height=480)

# Calling the basic plot function
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()