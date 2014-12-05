#Read in data downloaded and placed in working directory
electricpowerdat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

electricpowerdat$Date <- as.Date(electricpowerdat$Date, format="%d/%m/%Y")

#Subset data to reflect the two dates
subsetdat <- subset(electricpowerdat, Date >= "2007-02-01" & Date <="2007-02-02")
subsetdat$Fulldate <- paste(subsetdat$Date, subsetdat$Time)
subsetdat$day <- as.POSIXct(subsetdat$Fulldate)

#Recreate plot4
png("plot4.png")
par(mfrow=c(2,2))

#Plot1
subsetdat[ ,3] = as.double(subsetdat[,3])
plot(subsetdat$day, subsetdat$Global_active_power, type="l", ylab="Global Acive Power", xlab="")

#Plot2
plot(subsetdat$day, subsetdat$Voltage, type="l", ylab="Voltage", xlab="datetime")

#Plot3
plot(subsetdat$day, subsetdat[ ,7], type="l", ylab="Energy sub metering", xlab="", col="black")
lines(subsetdat$day, subsetdat[ ,8], type="l", col="red")
lines(subsetdat$day, subsetdat[ ,9], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lwd=c(2,2), bty="n")

#Plot4
plot(subsetdat$day, subsetdat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
       

