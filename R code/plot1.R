# Reading and subsetting power consumption data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
head(mydata)
subdata <- subset(mydata, mydata$Date== "1/2/2007" | mydata$Date =="2/2/2007")

#Extracting the missing values
globalActivePower <- as.numeric(subdata$Global_active_power)

# Creating png file
png("plot1.png", width=480, height=480)

# Calling the basic plot function
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off() 