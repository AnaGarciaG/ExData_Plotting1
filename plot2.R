# Plot2
household <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
household$DateTime <- paste(household$Date, household$Time)
household$DateTime <- strptime(household$DateTime, format = "%d/%m/%Y %H:%M:%S")
household$DateTime <- as.POSIXct(household$DateTime)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
library(dplyr)
household.clean <- filter(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")

png(file="./plot2.png",width=480,height=480)
plot(household.clean$DateTime, household.clean$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()