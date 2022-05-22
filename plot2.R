# Exploratory Data Analysis
# Project 1
# RSJ
# May 21 2022
# plot2.R
# Per assignment requirements this is a line graph of 
# global kilowatt hours used Thursday, Friday and Saturday

# Read in the  data from the appropriate text file from the zip provided.
myData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Convert the date via as.Date per suggestion in assignment
myData[,"Date"] <- as.Date(myData[,"Date"],format = "%d/%m/%Y")

# Get the subset of data from only 02/01 through 02/02 per instructions
subData<-subset(myData,Date == "2007-02-01" | Date == "2007-02-02")

# Convert the date time
myDateTime<-strptime(paste(subData$Date,subData$Time,sep = " "), "%Y-%m-%d %H:%M:%S" )

# Convert the string data we read in to numerics using as.numeric
globalActivePower <- as.numeric(subData[,"Global_active_power"])

# Open the graphics device for the file and resolution specified
# in the assignment. 
png("plot2.png",width = 480, height = 480)

# Create the plot specified in the assignment
# instructions, with the labels as per example. 
plot(myDateTime,globalActivePower,type = "l",xlab = " ",ylab = "Global Active Power (kilowatts)")

# Close the graphics device
dev.off()
# Done
