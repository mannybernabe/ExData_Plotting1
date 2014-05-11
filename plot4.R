###plot 4 ###

###READ DATA####

data<-read.table("household_power_consumption.txt",header=TRUE, sep=";",
                 nrows=90000, check.names = FALSE, stringsAsFactors=FALSE,colClasses = "character" )

data$Date<-as.Date(data$Date,"%d/%m/%Y")

sub<-subset(data, (Date == c("2007-02-01") | Date == c("2007-02-02") ))

sub$datetime<-as.POSIXct(strptime(paste(sub$Date,sub$Time), "%Y-%m-%d %H:%M:%S"))

sub$Global_active_power<-as.numeric(sub$Global_active_power)

####GRAPH DATA#####


png(file="plot4.png")

par(mfrow=c(2,2))

#1/4
with(sub, plot(datetime, Global_active_power,type="l", 
               ylab="Global Active Power (kilowatts)",
               xlab=""))

#2/4

with(sub,plot(datetime, Voltage, type="l"))

#3/4

with(sub, plot(datetime,Sub_metering_1,type="l", 
               col="black",main="", 
               ylab="Energy sub meeting",
               xlab=""))

with(sub, points(datetime,Sub_metering_2,type="l", col="red"))
with(sub, points(datetime,Sub_metering_3,type="l", col="blue"))

legend("topright",lty=1, col=c("black", "red", "blue"), bty = "n", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#4/4

with(sub, plot(datetime, Global_reactive_power, type="l"))

dev.off()