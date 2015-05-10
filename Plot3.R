## Using SQLDF package to read subset of data
install.packages("sqldf")
library(sqldf)
library(tcltk)
x = read.csv.sql("household_power_consumption.txt",sql="select * from file where Date in ('1/2/2007','2/2/2007')",sep=';',nrow=10)

## The dataframe y contains manipulated data from the file 
y = x 
y$Date = as.Date(x$Date,"%d/%m/%Y")
temp = paste(y$Date, x$Time)
y$Time = strptime(temp,"%Y-%m-%d %H:%M:%S")

## Plot the graph 
with(y,plot(Time,Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering"))
with(y,lines(Time,Sub_metering_2,type="l",col="red"))
with(y,lines(Time,Sub_metering_3,type="l",col="blue"))
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1)
dev.copy(png, file = "plot3.png",width=480,height=480)
dev.off()