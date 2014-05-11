###plot 2 ###

###READ DATA####

data<-read.table("household_power_consumption.txt",header=TRUE, sep=";",
                 nrows=90000, check.names = FALSE, stringsAsFactors=FALSE,colClasses = "character" )

data$Date<-as.Date(data$Date,"%d/%m/%Y")

sub<-subset(data, (Date == c("2007-02-01") | Date == c("2007-02-02") ))

sub$datetime<-as.POSIXct(strptime(paste(sub$Date,sub$Time), "%Y-%m-%d %H:%M:%S"))

sub$Global_active_power<-as.numeric(sub$Global_active_power)

####GRAPH DATA#####

png(file="plot2.png")

with(sub, plot(datetime, Global_active_power,type="l", 
               ylab="Global Active Power (kilowatts)",
               xlab=""))
dev.off()