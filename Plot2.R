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
with(y,plot(Time,Global_active_power,type="l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()