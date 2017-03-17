
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
