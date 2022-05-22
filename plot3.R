# Exploratory Data Analysis
# Project 1
# RSJ
# May 21 2022
# plot3.R
# Per assignment requirements this is a multi line graph of 
# kilowatt hours via sub metering 1, 2, and 3 for 
# Thursday, Friday and Saturday


# Read in the  data from the appropriate text file from the zip provided.
myData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Convert the date via as.Date per suggestion in assignment
myData[,"Date"] <- as.Date(myData[,"Date"],format = "%d/%m/%Y")

# Get the subset of data from only 02/01 through 02/02 per instructions
subData<-subset(myData,Date == "2007-02-01" | Date == "2007-02-02")

# Convert the date time
myDateTime<-strptime(paste(subData$Date,subData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

# Convert the string data we read in to numerics using as.numeric
subMeter1<-as.numeric(subData[,"Sub_metering_1"])
subMeter2<-as.numeric(subData[,"Sub_metering_2"])
subMeter3<-as.numeric(subData[,"Sub_metering_3"])

# Open the graphic device for the file and resolution specified
# in the assignment. 
png("plot3.png",width = 480, height = 480)

# Create the plot as per example and colors for each line as per example. 
plot(myDateTime,subMeter1,col = "black",type = "l", xlab = " ", ylab = "Energy sub metering")
lines(myDateTime, subMeter2, col = "red")
lines(myDateTime, subMeter3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))

# Close the graphics device
dev.off()
# Done
