#Ploting Household Usage Energy - Plot2
#By Ahlulwulus

dataPowerUsage <- "household_power_consumption.txt"
data <- read.table(dataPowerUsage, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#subsetData
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivePower <- as.numeric(subsetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalactivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()