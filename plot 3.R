# Plot 3

hpc<-fread("household_power_consumption.txt", na.strings = "?")
subsethpc<-filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))

subsethpc$datetime<-strptime(paste(subsethpc$Date, subsethpc$Time, sep=""), "%d/%m/%Y %H:%M:%S")
subsethpc$datetime<-as.POSIXct(subsethpc$datetime)

png("Plot3.png", width = 480, height= 480)

with(subsethpc, plot(Sub_metering_1~datetime, type="l", ylab = "Energy sub metering", xlab = ""))
lines(subsethpc$Sub_metering_2~subsethpc$datetime, col="red")
lines(subsethpc$Sub_metering_3~subsethpc$datetime, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lwd=2)
dev.off()
