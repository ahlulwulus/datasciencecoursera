#Ploting Household Usage Energy - Plot1
#By Ahlulwulus

dataPowerUsage <- "household_power_consumption.txt"
data <- read.table(dataPowerUsage, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#subsetData
globalactivePower <- as.numeric(subsetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()