##Read data
data <-read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
##Subset data only for dates needed
hpcdata <-rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
## Change data type
hpcdata$Date <- as.Date(hpcdata$Date,"%d/%m/%Y")
hpcdata<-cbind(hpcdata, "DateTime" = as.POSIXct(paste(hpcdata$Date, hpcdata$Time)))

##Plot 2
plot(hpcdata$Global_active_power ~ hpcdata$DateTime, type = 'scatter', mode = 'line', ylab = "Global Active Power (kilowatts)", xlab = "")
##Save png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()


