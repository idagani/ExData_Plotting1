Sys.setlocale("LC_TIME", "English")

#change directory to working directory
setwd("c:/courses/exploratory data analysis")

# load data table from file
classes = c("character", "character", "character", "character", "character", "character", "character", "character", "character")
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";", colClasses=classes)

# filter data from the dates 2007-02-01 and 2007-02-02
dates <- c("1/2/2007","2/2/2007")
filter_data <- data[data$Date %in% dates,]

# merge Date & Time columns
DateTime <- as.POSIXct(paste(filter_data$Date, filter_data$Time), format="%d/%m/%Y %H:%M:%S")

DT <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")

# convert to numeric
filter_data$Global_active_power <- as.numeric(filter_data$Global_active_power)
filter_data$Sub_metering_1 <- as.numeric(filter_data$Sub_metering_1)
filter_data$Sub_metering_2 <- as.numeric(filter_data$Sub_metering_2)
filter_data$Sub_metering_3 <- as.numeric(filter_data$Sub_metering_3)
filter_data$Voltage <- as.numeric(filter_data$Voltage)
filter_data$Global_reactive_power <- as.numeric(filter_data$Global_reactive_power)

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# upper left plot #1

with(data, plot(DT, filter_data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l"))


# bottom left plot #2

with(data, plot(DT, filter_data$Voltage, xlab="datetime", ylab="Voltage" ,type = "l", lwd=1))


#upper right plot #3

plot(DT, filter_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l", col="black")
lines(DT, filter_data$Sub_metering_2, col="red")
lines(DT, filter_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))


#lower right plot #4

with(data, plot(DT, filter_data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power" ,type = "l", lwd=1))

dev.off()