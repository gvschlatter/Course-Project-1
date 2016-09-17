## Read the work file
## Note: work file must be at current directory
df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## Convert Date to the right class
df$Date <- as.Date(df$Date,format="%d/%m/%Y")

## Subset working file to chosen days
workingDf <- df[(df$Date=="2007-02-01" | df$Date=="2007-02-02"),]

# Generate histogram and copy to png file
hist(workingDf$Global_active_power, col="red", breaks = 12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()