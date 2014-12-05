#Read in data downloaded and placed in working directory
electricpowerdat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

electricpowerdat$Date <- as.Date(electricpowerdat$Date, format="%d/%m/%Y")

#Subset data to reflect the two dates
subsetdat <- subset(electricpowerdat, Date >= "2007-02-01" & Date <="2007-02-02")
subsetdat$Fulldate <- paste(subsetdat$Date, subsetdat$Time)
subsetdat$day <- as.POSIXct(subsetdat$Fulldate)
subsetdat[,3] <- as.double(subsetdat[ ,3])

#Recreate plot2
png("plot2.png")
plot(subsetdat$day, subsetdat$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

dev.off()


