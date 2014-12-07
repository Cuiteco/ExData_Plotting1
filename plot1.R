## Script for doing the first project in Exploratory Data Analysis
##
## The File household_power_consumption.txt should be in the working directory
library(sqldf)
library(datasets)
file<-"household_power_consumption.txt"
tipos<- list(Date='char', Time='char', Global_active_power='real', Global_reactive_power='real', Voltage='real', Global_intensity='real', Sub_metering_1='int',Sub_metering_2='int',Sub_meterin_3='int')
Only<-read.csv2.sql(file,sql="select * from file where Date='1/2/2007' or Date='2/2/2007'",field.types=tipos)
Only$Date<-dmy(Only$Date)
Only$Global_active_power<-as.numeric(Only$Global_active_power)
png(file="plot1.png")
hist(Only$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
