#Plot 2

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

# Create Plot 2 
plot(datetime,group$Global_active_power, type = "s", 
     ylab="Global Active Power (kilowatts)", xlab="")

# To a PNG
dev.copy(device = png,filename="plot2.png", width=480, height=480, units="px")
dev.off()