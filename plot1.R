# Plot1
household <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
head(household)
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")
library(dplyr)
household.clean <- filter(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")
png(file="./plot1.png",width=480,height=480)
hist(household.clean$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
