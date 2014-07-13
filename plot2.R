DF <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
DF$Date <- as.Date(DF$Date, format = "%d/%m/%Y")
DF1 <- DF[DF$Date >= "2007-02-01" & DF$Date <= "2007-02-02", ]
DF1 <- rbind(DF1, DF[DF$Date == "2007-02-03" & DF$Time == "00:00:00", ])
Sys.setlocale("LC_TIME", "us_US")
DateTime <- strftime(paste(DF1$Date, DF1$Time), format = "%Y-%m-%d %H:%M:%S")
DayOfWeek <- strftime(DateTime, format = "%a")
DF2 <- cbind(DayOfWeek, DateTime, DF1)
png(file = "plot2.png")
plot(DF2$DateTime, DF2$Global_active_power, 
     main = "", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")
lines(DF2$DateTime, DF2$Global_active_power)
axis(1, at = DF2$DateTime[DF2$Time == "00:00:00"], 
     labels = DF2$DayOfWeek[DF2$Time == "00:00:00"])
dev.off()