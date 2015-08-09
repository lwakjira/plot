
dir <- "C:/Users/lwakjira/Documents/fy16 training/Data Science/data"
setwd(dir)
#read in household power file and filter for data in date range
hshld <- "./household_power_consumption.txt"
hshld_data <- read.table(hshld, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hshld_sub <- hshld_data[hshld_data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot1
globalActivePower <- as.numeric(hshld_sub$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
