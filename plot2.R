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

## Plot and copy to png
plot(y, workingDf$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()