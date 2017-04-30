##Read data
data <-read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
##Subset data only for dates needed
hpcdata <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
## Change data type
hpcdata$Date <- as.Date(hpcdata$Date,"%d/%m/%Y")
hpcdata<-cbind(hpcdata, "DateTime" = as.POSIXct(paste(hpcdata$Date, hpcdata$Time)))

##Plot 4
par(mfrow = c(2,2))
##First Plot
plot(hpcdata$DateTime, hpcdata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = 'scatter', mode = 'line')
##Second Plot
plot(hpcdata$Voltage ~ hpcdata$DateTime, type = 'scatter', mode = 'line', ylab = "Voltage", xlab = "datetime")
##Third Plot
with(hpcdata, {plot(hpcdata$Sub_metering_1 ~ hpcdata$DateTime , type = 'scatter', mode = 'line', ylab = "Energy sub meetring", xlab = "")})
lines(hpcdata$Sub_metering_2 ~ hpcdata$DateTime, col = "red")
lines(hpcdata$Sub_metering_3 ~ hpcdata$DateTime, col = "blue")
legend("topright", lty = 1, lwd = 3, col = c("black", "red", "blue"), legend = c("Sub_meetering_1", "Sub_meetering_2", "Sub_meetering_3"))
##Fourth Plot
plot(hpcdata$Global_reactive_power ~ hpcdata$DateTime, type = 'scatter', mode = 'line', ylab = "Global_reactive_power", xlab = "datetime")
##Save png file
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

