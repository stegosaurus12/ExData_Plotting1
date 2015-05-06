#plot line graph of global active power over time

#read in only part of data to save memory
headers <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, nrows = 1)
data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, na.string = "?", colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = 66600, nrows = 4000)
names(data) <- unlist(headers)

#subset data
data <- data[which(data$Date == "1/2/2007" | data$Date == "2/2/2007"),]
#drop extra factor levels
data$Date <- factor(data$Date)

#combine time & date
temp <- paste(data$Date, data$Time)
data$timedate <- strptime(temp, " %e/%m/%Y %T")

#graph histogram
png("plot2.png")
plot(x = data$timedate, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

