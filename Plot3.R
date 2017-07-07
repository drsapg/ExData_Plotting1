#Plot 3

# Read the data
#datos <- read.table("household_power_consumption.txt", nrows = 100, header=TRUE, sep=";")

#Explore data to pass colClasses
#sapply(datos,class)
classes <- c("character","character","numeric","numeric","numeric","numeric",
             "numeric","numeric","numeric")

# Import all the data
datos <- read.table("household_power_consumption.txt", 
                    header=TRUE, sep=";", colClasses=classes, na.strings="?")

# Set date-time as POSIXct
datos$Date <- strptime(datos$Date,"%d/%m/%Y")

# Subsetting the target dates
# Should be improved, this way is slow
group <- subset(datos, datos$Date >= "2007-02-01" & datos$Date <="2007-02-02")

# Vector with date-time
datetime <- paste(group$Date,group$Time,sep = " ")
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# Create Plot 3
plot(datetime,group$Sub_metering_1, type="s", ylab="Energy sub mettering", xlab="",  col="black")
lines(datetime,group$Sub_metering_2, col="red")
lines(datetime,group$Sub_metering_3, col="blue")
legend(x="topright",col=c("black","red","blue"), legend=c("Sub_mettering_1","Sub_mettering_2","Sub_mettering_3"), 
       lty=1, seg.len=1, cex=0.8, y.intersp=0.8, inset = c(0,0,0,0), xjust=0,yjust=0,adj=0)

# To a PNG
dev.copy(device = png,filename="plot3.png", width=480, height=480, units="px")
dev.off()