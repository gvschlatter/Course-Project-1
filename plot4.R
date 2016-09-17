## Read the work file
## Note: work file must be at current directory
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Convert Date to the right class
df$Date <- as.Date(df$Date,format="%d/%m/%Y")

## Subset working file to chosen days
workingDf <- df[(df$Date=="2007-02-01" | df$Date=="2007-02-02"),]

## Format day and time
Sys.setlocale(category = "LC_ALL", locale = "english")
x <- paste(workingDf$Date,workingDf$Time)
y <- strptime(x,"%Y-%m-%d %H:%M:%S")

## Plot 4 different graphs and copy to png
par(mfrow=c(2,2))
plot(y, workingDf$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(y,workingDf$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(y, workingDf$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
points(y, workingDf$Sub_metering_2,type="l", col="red",xlab="", ylab="Energy sub metering")
points(y, workingDf$Sub_metering_3,type="l", col="blue",xlab="", ylab="Energy sub metering")
legend("topright", legend=c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), bty="n",lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"),y.intersp = 0.2, cex=0.7)

plot(y,workingDf$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
par(mfrow=c(1,1))