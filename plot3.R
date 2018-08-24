fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
a <- download.file(fileUrl,destfile = "C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
b <- unzip("C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
y <- read.delim(b, sep=";", header = T)
y$Date <- strptime(paste(y$Date,y$Time), format= "%d/%m/%Y %H:%M:%S")
y$Time <- NULL
w <- subset(y,y$Date$year==107 & y$Date$mon==1 & (y$Date$mday==1 |y$Date$mday==2))
w$Sub_metering_1 <- as.numeric(levels(w$Sub_metering_1))[w$Sub_metering_1]
w$Sub_metering_2 <- as.numeric(levels(w$Sub_metering_2))[w$Sub_metering_2]
w$Sub_metering_3 <- as.numeric(levels(w$Sub_metering_3))[w$Sub_metering_3]
old.system <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png(file="plot3.png",width=480,height=480,units="px")
plot(w$Date,w$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
lines(w$Date,w$Sub_metering_2,type="l",col="red")
lines(w$Date,w$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()
Sys.setlocale("LC_TIME",old.system)
