plot(DataSet$Sub_metering_1 ~ DataSet$DateTime, type = 'l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(DataSet$Sub_metering_2 ~ DataSet$DateTime, type = 'l', col = 'red')
lines(DataSet$Sub_metering_3 ~ DataSet$DateTime, type = 'l', col = 'blue')
legend("topright", col=c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
