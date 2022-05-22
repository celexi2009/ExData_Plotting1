# Exploratory Data Analysis
# Project 1
# RSJ
# May 21 2022
# plot1.R
# Per assignment requirements this is a histogram plot of 
# global kilowatt hours used during the month of February

# Read in the  data from the appropriate text file from the zip provided.
myData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Convert the date format via as.Date per suggestion in assignment
myData[,"Date"] <- as.Date(myData[,"Date"],format = "%d/%m/%Y")

# Get the subset of data from only 02/01 through 02/02 per instructions
subData <- subset(myData,Date == "2007-02-01" | Date == "2007-02-02")

# Convert the string data we read in to numerics using as.numeric
globalActivePower <- suppressWarnings(as.numeric(subData[,"Global_active_power"]))

# Open the graphics device for the file and resolution specified
# in the assignment. 
png("plot1.png",width = 480, height = 480)

# Make the plot with the example color showing red, and 
# example labels as per example in assignment.
hist(globalActivePower, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Close the graphics device
dev.off()
# Done
