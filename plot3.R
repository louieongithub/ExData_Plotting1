hpc<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
columnnames<-hpc[1,]
namesv<-as.vector(columnnames)
namesv1<-unlist(namesv,use.names=FALSE)
colnames(hpc)<-namesv1
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")
hpc.sub <- subset(hpc, Date=="2007-2-1"|Date=="2007-2-2")
hpc.sub$datetime<-paste(hpc.sub$Date,hpc.sub$Time)
hpc.sub$datetime<-as.POSIXlt(hpc.sub$datetime)
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2), oma = c(0, 0, 0, 0),ps=12)
with(hpc.sub, plot(datetime, Sub_metering_1, main = "",type="l",xlab="",ylab="Energy sub metering"))
with(hpc.sub,lines(datetime,Sub_metering_2,col="red"))
with(hpc.sub,lines(datetime,Sub_metering_3,col="blue"))
 legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()


