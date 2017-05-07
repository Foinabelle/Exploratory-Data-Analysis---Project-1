#Plot 1 - Histogram

hpc<-fread("household_power_consumption.txt", na.strings = "?")
subsethpc<-filter(hpc, Date %in% c("1/2/2007", "2/2/2007"))
png("plot1.png", width=480, height = 480)
hist(subsethpc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
