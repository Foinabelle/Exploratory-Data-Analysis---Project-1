#Plot 2

hpc<-fread("household_power_consumption.txt", na.strings = "?")
subsethpc<-filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))

subsethpc$datetime<-strptime(paste(subsethpc$Date, subsethpc$Time, sep=""), "%d/%m/%Y %H:%M:%S")
subsethpc$datetime<-as.POSIXct(subsethpc$datetime)

png("Plot2.png", width = 480, height = 480)
with(subsethpc, plot(Global_active_power~datetime, type="l", ylab = "Global Active Power (Kilowatts)", xlab = ""))
dev.off()
