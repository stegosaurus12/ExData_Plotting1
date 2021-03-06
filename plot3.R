#plot line graph of energy sub metering 

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
png("plot3.png")
plot(x = data$timedate, y = data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(x = data$timedate, y = data$Sub_metering_2, col = "red")
lines(x = data$timedate, y = data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


