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
#Transform Global_active_power data into numeric
w$Global_active_power <- as.numeric(levels(w$Global_active_power))[w$Global_active_power]
#Save the local system (in case is not an english environment), for dates in english purposes
old.system <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png(file="plot2.png",width=480,height=480,units="px")
plot(w$Date, w$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
Sys.setlocale("LC_TIME",old.system)
