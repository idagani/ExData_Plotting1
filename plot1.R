#change directory to working directory
setwd("c:/courses/exploratory data analysis")

# load data table from file
classes = c("character", "character", "character", "character", "character", "character", "character", "character", "character")
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";", colClasses=classes)

# convert date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# filter data from the dates 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01","2007-02-02"), "%Y-%m-%d")
filter_data <- data[data$Date %in% dates,]

# convert Global_active_power to numeric
filter_data$Global_active_power <- as.numeric(filter_data$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist(filter_data$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()