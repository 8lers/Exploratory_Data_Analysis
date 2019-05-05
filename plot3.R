#Reading in data from the source. Note that we are only using data from 1/2/2007 and 2/2/2007, so we have to select those dates
all_data=read.delim('C:/Users/leifs/Documents/exdata_data_household_power_consumption/household_power_consumption.txt', header = TRUE, sep = ";", dec = ".")
data=all_data[all_data$Date=='1/2/2007' | all_data$Date=='2/2/2007', ]

#Part 3
#In this section, note that multiple plots can be combined by only calling the plot() function for the first
#instance and calling line() for each subsequent one. This is because plot() opens a new window, we don't want to 
#do that every time!
png('plot3.png', width=480, height=480)

plot(seq(1, length(as.numeric(as.character(data$Sub_metering_1))), by=1), as.numeric(as.character(data$Sub_metering_1)), type='l',
     xlab='', ylab='Energy sub metering', col='black',  xaxt='n')
lines(seq(1, length(as.numeric(as.character(data$Sub_metering_2))), by=1), as.numeric(as.character(data$Sub_metering_2)),
      xlab='', ylab='Energy sub metering', col='red', xaxt='n')
lines(seq(1, length(as.numeric(as.character(data$Sub_metering_3))), by=1), as.numeric(as.character(data$Sub_metering_3)),
      xlab='', ylab='Energy sub metering', col='blue', xaxt='n')
axis(side=1, at=seq(0, 2880, by=1440), labels=c('Thu', 'Fri', 'Sat'))
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), cex=0.75)

dev.off()