#Reading in data from the source. Note that we are only using data from 1/2/2007 and 2/2/2007, so we have to select those dates
all_data=read.delim('C:/Users/leifs/Documents/exdata_data_household_power_consumption/household_power_consumption.txt', header = TRUE, sep = ";", dec = ".")
data=all_data[all_data$Date=='1/2/2007' | all_data$Date=='2/2/2007', ]

#Part 4
#Last, we can create subplots wit the par() function and setting either mfrow of mfcol (the difference is in the way they
#are incremented but the results are otherwise the same)
png('plot4.png', width=480, height=480)

par(mfrow=c(2,2))
#subplot1
plot(seq(1, length(as.numeric(as.character(data$Global_active_power))), by=1), as.numeric(as.character(data$Global_active_power)), type='l',
     xlab='', ylab='Global Active Power', xaxt='n')
axis(side=1, at=seq(0, 2880, by=1440), labels=c('Thu', 'Fri', 'Sat'))
#subplot2
plot(seq(1, length(as.numeric(as.character(data$Voltage))), by=1), as.numeric(as.character(data$Voltage)), type='l',
     xlab='datetime', ylab='Voltage', xaxt='n')
axis(side=1, at=seq(0, 2880, by=1440), labels=c('Thu', 'Fri', 'Sat'))
#subplot3
plot(seq(1, length(as.numeric(as.character(data$Sub_metering_1))), by=1), as.numeric(as.character(data$Sub_metering_1)), type='l',
     xlab='', ylab='Energy sub metering', col='black',  xaxt='n')
lines(seq(1, length(as.numeric(as.character(data$Sub_metering_2))), by=1), as.numeric(as.character(data$Sub_metering_2)),
      xlab='', ylab='Energy sub metering', col='red', xaxt='n')
lines(seq(1, length(as.numeric(as.character(data$Sub_metering_3))), by=1), as.numeric(as.character(data$Sub_metering_3)),
      xlab='', ylab='Energy sub metering', col='blue', xaxt='n')
axis(side=1, at=seq(0, 2880, by=1440), labels=c('Thu', 'Fri', 'Sat'))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), cex=0.75)
#subplot4
plot(seq(1, length(as.numeric(as.character(data$Global_reactive_power))), by=1), as.numeric(as.character(data$Global_reactive_power)), type='l',
     xlab='datetime', ylab='Global reactive power', xaxt='n')
axis(side=1, at=seq(0, 2880, by=1440), labels=c('Thu', 'Fri', 'Sat'))

dev.off()

