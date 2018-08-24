#Get the file URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#Download the file zip file
a <- download.file(fileUrl,destfile = "C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
#Unzip the file
b <- unzip("C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
#Read the file
y <- read.delim(b, sep=";", header = T)
#Transform Date column into Date format
y$Date <- strptime(y$Date, format= "%d/%m/%Y")
#Subset the data considering only dates between 2007-02-01 and 2007-02-02
w <- subset(y,y$Date$year==107 & y$Date$mon==1 & (y$Date$mday==1 |y$Date$mday==2))
#Transform Global_active_power data into numeric
w$Global_active_power <- as.numeric(levels(w$Global_active_power))[w$Global_active_power]
#Save the local system (in case is not an english environment), for dates in english purposes
old.system <- Sys.getlocale("LC_TIME")
#Sets the local system into "English", for dates in english purposes
Sys.setlocale("LC_TIME", "English")
#Creates the png file, with required specifications
png(file="plot1.png",width=480,height=480,units="px")
#Creates the required histogram
hist(w$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
#Turn off the device
dev.off()
#Sets the local system into the old
Sys.setlocale("LC_TIME",old.system)
