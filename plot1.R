## function to plot a histogram of the global active power 
plot1 <- function(){
  ## read file into r 
  mydata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header= TRUE, sep = ";")
  
  ## change class of all columns to correct class
  mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
  mydata$Time <- format(mydata$Time, format="%H:%M:%S")
  mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
  mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
  mydata$Voltage <- as.numeric(mydata$Voltage)
  mydata$Global_intensity <- as.numeric(mydata$Global_intensity)
  mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
  mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
  mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)
  
  ##subset the data for the 2 days we need
  subsetdata <- subset(mydata, Date == "2007-02-01" | Date =="2007-02-02")
  ##plot a histogram for these two days 
  
  png("plottest.png", width= 480, height= 480)
  hist(subsetdata$Global_active_power, col= "red", border = "black", main = "Global Active Power", xlab = "global active power(kilowats)", ylab = "frequency")
  dev.off()
  
  
}