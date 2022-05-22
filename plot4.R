# Exploratory Data Analysis
# Project 1
# RSJ
# May 21 2022
# plot4.R
# Per assignment requirements this is a quad plot 
# kilowatt hours, kWh via sub metering 1, 2, and 3, 
# date vs voltage, and global active power for 
# Thursday, Friday and Saturday

# Read in the  data from the appropriate text file from the zip provided.
myData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Convert the date via as.Date per suggestion in assignment
myData[,"Date"] <- as.Date(myData[,"Date"],format = "%d/%m/%Y")

# Get the subset of data from only 02/01 through 02/02 per instructions
subData <- subset(myData,Date == "2007-02-01" | Date == "2007-02-02")

# Convert the string data we read in to numerics using as.numeric
globalActovePower <- suppressWarnings(as.numeric(subData[,"Global_active_power"]))

# Convert the date time
myDateTime <- strptime(paste(subData$Date,subData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

subMeter1 <- as.numeric(subData[,"Sub_metering_1"])
subMeter2 <- as.numeric(subData[,"Sub_metering_2"])
subMeter3 <- as.numeric(subData[,"Sub_metering_3"])
globalActivePower <- as.numeric(subData[,"Global_reactive_power"])
displayVoltage <- as.numeric(subData[,"Voltage"])

# Open the graphic device for the file and resolution specified
# in the assignment. 
png("plot4.png",width = 480, height = 480)

# Create a 2 by 2 grid for the quad chart
par(mfrow = c(2,2))

# Create each plot as per the example, in the correct order
plot(myDateTime, globalActivePower, type = "l", xlab = " ", ylab = "Global Active Power")
plot(myDateTime, displayVoltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(myDateTime, subMeter1,col = "black", type = "l", xlab = " ", ylab = "Energy sub metering")
lines(myDateTime, subMeter2, col = "red")
lines(myDateTime, subMeter3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

plot(myDateTime,globalActivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close the graphics device
dev.off()
# Done