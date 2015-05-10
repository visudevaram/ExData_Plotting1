## Using SQLDF package to read subset of data
install.packages("sqldf")
library(sqldf)
library(tcltk)
x = read.csv.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')",sep=';')

## The dataframe y contains manipulated data from the file 
y = x 
y$Date = as.Date(x$Date,"%d/%m/%Y")
temp = paste(y$Date, x$Time)
y$Time = strptime(temp,"%Y-%m-%d %H:%M:%S")

## Plot the graph 
par(mfrow = c(2,2))
with(y,plot(Time,Global_active_power,type="l",xlab = "",ylab = "Global Active Power"))
with(y,plot(Time,Voltage,type="l",xlab = "datetime",ylab = "Voltage"))
with(y,plot(Time,Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering"))
with(y,lines(Time,Sub_metering_2,type="l",col="red"))
with(y,lines(Time,Sub_metering_3,type="l",col="blue"))
legend("topright", lty = 1, bty = "n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(y,plot(Time,Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power"))
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()