DF <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
DF$Date <- as.Date(DF$Date, format = "%d/%m/%Y")
DF1 <- DF[DF$Date >= "2007-02-01" & DF$Date <= "2007-02-02",]
DF1 <- rbind(DF1, DF[DF$Date == "2007-02-03" & DF$Time == "00:00:00", ])
png(file = "plot1.png")
hist(DF1$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()