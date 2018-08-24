#Get the file URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#Download the file zip file
a <- download.file(fileUrl,destfile = "C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
#Unzip the file
b <- unzip("C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
#Read the file
y <- read.delim(b, sep=";", header = T)
#Paste the columns Date and Time into the Date column, and then transform the column into Date format
y$Date <- strptime(paste(y$Date,y$Time), format= "%d/%m/%Y %H:%M:%S")
#Eliminate Time column
y$Time <- NULL
#Subset the data considering only dates between 2007-02-01 and 2007-02-02
w <- subset(y,y$Date$year==107 & y$Date$mon==1 & (y$Date$mday==1 |y$Date$mday==2))
#Transform Global_active_power, Voltage, Global_reactive_power, Sub_metering_1, Sub_metering_2 and Sub_metering_3 data into numeric
w$Global_active_power <- as.numeric(levels(w$Global_active_power))[w$Global_active_power]
w$Voltage <- as.numeric(levels(w$Voltage))[w$Voltage]
w$Global_reactive_power <- as.numeric(levels(w$Global_reactive_power))[w$Global_reactive_power]
w$Sub_metering_1 <- as.numeric(levels(w$Sub_metering_1))[w$Sub_metering_1]
w$Sub_metering_2 <- as.numeric(levels(w$Sub_metering_2))[w$Sub_metering_2]
w$Sub_metering_3 <- as.numeric(levels(w$Sub_metering_3))[w$Sub_metering_3]
#Save the local system (in case is not an english environment), for dates in english purposes
old.system <- Sys.getlocale("LC_TIME")
#Sets the local system into "English", for dates in english purposes
Sys.setlocale("LC_TIME", "English")
#Creates the png file, with required specifications
png(file="plot4.png",width=480,height=480,units="px")
#Set the space for the 4 plots (2 rows and 2 columns)
par(mfrow=c(2,2))
#Creates the required plot
plot(w$Date,w$Global_active_power,type="l",xlab="",ylab="Global Active Power",col="black")
#Creates the required plot
plot(w$Date,w$Voltage,type="l",xlab="datetime",ylab="Global Active Power",col="black")
#Creates the required plot, and then add all the series with their specifications, and finally add the legend
plot(w$Date,w$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(w$Date,w$Sub_metering_2,type="l",col="red")
lines(w$Date,w$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, bty="n")
#Creates the required plot
plot(w$Date,w$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",col="black")
#Turn off the device
dev.off()
#Set the local system into the old
Sys.setlocale("LC_TIME",old.system)
