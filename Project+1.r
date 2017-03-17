
Power <- read.table('household_power_consumption.txt', sep = ';', header = T, na.strings = c("NA","NaN", "?"))
head(Power)

library(lubridate)
date <- dmy(Power$Date)
Power$Date <- date

head(date)
ind <- (date >= as.Date('2007-02-01') & date <= as.Date('2007-02-02'))
DataSet <- Power[ind, ]

hist(DataSet$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power in KW')

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

DateTime <- paste(DataSet$Date, DataSet$Time)
DataSet$DateTime <- ymd_hms(DateTime)
plot(DataSet$Global_active_power ~ DataSet$DateTime, type = 'l', ylab = 'Global Active Power in KW', xlab = '')

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

plot(DataSet$Sub_metering_1 ~ DataSet$DateTime, type = 'l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(DataSet$Sub_metering_2 ~ DataSet$DateTime, type = 'l', col = 'red')
lines(DataSet$Sub_metering_3 ~ DataSet$DateTime, type = 'l', col = 'blue')
legend("topright", col=c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

par(mfrow = c(2,2))
plot(DataSet$Global_active_power ~ DataSet$DateTime, type = 'l', ylab = 'Global Active Power in KW', xlab = '')

plot(DataSet$Voltage ~ DataSet$DateTime, type = 'l', ylab = 'Voltage', xlab = 'datetime')

plot(DataSet$Sub_metering_1 ~ DataSet$DateTime, type = 'l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(DataSet$Sub_metering_2 ~ DataSet$DateTime, type = 'l', col = 'red')
lines(DataSet$Sub_metering_3 ~ DataSet$DateTime, type = 'l', col = 'blue')
legend("topright", col=c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(DataSet$Global_reactive_power ~ DataSet$DateTime, type = 'l', ylab = 'Global Reactive Power in KW', xlab = 'datetime')
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


