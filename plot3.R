## Script for doing the first project in Exploratory Data Analysis
##
## The File household_power_consumption.txt should be in the working directory
setwd("~/Documents/Coursera/ExData_Plotting1")
library(sqldf)
library(datasets)
library(lubridate)
file<-"household_power_consumption.txt"
tipos<- list(Date='char', Time='char', Global_active_power='real', Global_reactive_power='real', Voltage='real', Global_intensity='real', Sub_metering_1='real',Sub_metering_2='real',Sub_metering_3='real')
Only<-read.csv2.sql(file,sql="select * from file where Date='1/2/2007' or Date='2/2/2007'",field.types=tipos)
dh<-with(Only,paste(Date,Time))
x<-dmy_hms(dh)
Only$Global_active_power<-as.numeric(Only$Global_active_power)
png(file="plot3.png")
titulo="Energy sub metering"
plot(x,y=Only$Sub_metering_1,type="n",ylab=titulo,xlab="")
lines(x,y=Only$Sub_metering_1,type="l",col="black")
lines(x,y=Only$Sub_metering_2,type="l",col="red")
lines(x,y=Only$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()
