#Read in data downloaded and placed in working directory
electricpowerdat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings=c("?"))

#Subset data to reflect the two dates
subsetdat <- electricpowerdat[electricpowerdat$Date == "1/2/2007"|electricpowerdat$Date=="2/2/2007",]

#Recreate plot1
png("plot1.png")

hist(subsetdat$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power", ylab="Frequency",
     col="red")

dev.off()




