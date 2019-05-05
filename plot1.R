#Reading in data from the source. Note that we are only using data from 1/2/2007 and 2/2/2007, so we have to select those dates
all_data=read.delim('C:/Users/leifs/Documents/exdata_data_household_power_consumption/household_power_consumption.txt', header = TRUE, sep = ";", dec = ".")
data=all_data[all_data$Date=='1/2/2007' | all_data$Date=='2/2/2007', ]


#Part 1: Global active power histogram
#This will require the use of the hist() function, with changes made to the xlabels. This can be achieved by
#setting properties in the 'axis' function.
png('plot1.png', width=480, height=480)

hist(as.numeric(as.character(data$Global_active_power)), 
     xlab='Global Active Power (kilowatts)', ylab='Frequency', col='red', main='Global Active Power', yaxt='n')
axis(side=2, at=seq(0,1200,by=200), labels=seq(0,1200,by=200))

dev.off()