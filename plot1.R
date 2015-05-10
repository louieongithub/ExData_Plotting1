hpc<-read.table("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
columnnames<-hpc[1,]
namesv<-as.vector(columnnames)
namesv1<-unlist(namesv,use.names=FALSE)
colnames(hpc)<-namesv1
hpc$Date <- as.Date(hpc$Date , "%d/%m/%Y")
hpc.sub <- subset(hpc, Date=="2007-2-1"|Date=="2007-2-2")
gap<-hpc.sub[,3]
gapn<-as.numeric(gap)
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2), oma = c(0, 0, 0, 0),ps=12)
hist(gapn,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ##  close the PNG device!

