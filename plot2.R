#Reading in data from the source. Note that we are only using data from 1/2/2007 and 2/2/2007, so we have to select those dates
all_data=read.delim('C:/Users/leifs/Documents/exdata_data_household_power_consumption/household_power_consumption.txt', header = TRUE, sep = ";", dec = ".")
data=all_data[all_data$Date=='1/2/2007' | all_data$Date=='2/2/2007', ]

#Part 2
png('plot2.png', width=480, height=480)

plot(seq(1, length(as.numeric(as.character(data$Global_active_power))), by=1), as.numeric(as.character(data$Global_active_power)), type='l',
     xlab='', ylab='Global Active Power (kilowatts)', xaxt='n')
axis(side=1, at=seq(0, 2880, by=1440), labels=c('Thu', 'Fri', 'Sat'))

dev.off()