
dir <- "C:/Users/lwakjira/Documents/fy16 training/Data Science/data"
setwd(dir)
#read in household power file and filter for data in date range
hshld <- "./household_power_consumption.txt"
hshld_data <- read.table(hshld, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hshld_sub <- hshld_data[hshld_data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot3
datetime <- strptime(paste(hshld_sub$Date, hshld_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(hshld_sub$Global_active_power)
subMetering1 <- as.numeric(hshld_sub$Sub_metering_1)
subMetering2 <- as.numeric(hshld_sub$Sub_metering_2)
subMetering3 <- as.numeric(hshld_sub$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

