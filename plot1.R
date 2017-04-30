##Read data
data <-read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
##Subset data only for dates needed
hpcdata <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
## Change data type
hpcdata$Date <- as.Date(hpcdata$Date,"%d/%m/%Y")
hpcdata<-cbind(hpcdata, "DateTime" = as.POSIXct(paste(hpcdata$Date, hpcdata$Time)))

##Plot 1
hist(hpcdata$Global_active_power, col = "red")
hist(hpcdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)")
hist(hpcdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
##Save png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

