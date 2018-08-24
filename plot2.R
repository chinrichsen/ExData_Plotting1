fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
a <- download.file(fileUrl,destfile = "C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
b <- unzip("C:/Users/Carlos Hinrichsen/Data/w1c4.zip")
y <- read.delim(b, sep=";", header = T)
y$Date <- strptime(paste(y$Date,y$Time), format= "%d/%m/%Y %H:%M:%S")
y$Time <- NULL
w <- subset(y,y$Date$year==107 & y$Date$mon==1 & (y$Date$mday==1 |y$Date$mday==2))
w$Global_active_power <- as.numeric(levels(w$Global_active_power))[w$Global_active_power]
old.system <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")
png(file="plot2.png",width=480,height=480,units="px")
plot(w$Date, w$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
Sys.setlocale("LC_TIME",old.system)
