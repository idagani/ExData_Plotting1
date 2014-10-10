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

# convert Global_active_power to numeric
filter_data$Global_active_power <- as.numeric(filter_data$Global_active_power)

png("plot2.png", width = 480, height = 480)

with(data, plot(DT, filter_data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l"))

dev.off()
