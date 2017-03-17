DateTime <- paste(DataSet$Date, DataSet$Time)
DataSet$DateTime <- ymd_hms(DateTime)
plot(DataSet$Global_active_power ~ DataSet$DateTime, type = 'l', ylab = 'Global Active Power in KW', xlab = '')

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
