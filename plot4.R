household_power_consumption <- read.csv("household_power_consumption_sub.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")
household_power_consumption$DT_Str <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DT <- strptime(household_power_consumption$DT_Str, format='%d/%m/%Y %H:%M:%S')

## display 4 plots
par(mfcol=c(2,2))

## plot2 with a new y lable
plot(household_power_consumption$DT,household_power_consumption$Global_active_power, type="l", ylab="Global Active Power",xlab="")

## plot3 with a new legend
plot(household_power_consumption$DT, household_power_consumption$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering",col="black")
lines(household_power_consumption$DT,household_power_consumption$Sub_metering_2, col="red")
lines(household_power_consumption$DT,household_power_consumption$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red" ,"blue"), legend = c("Sub_metering_1         ", "Sub_metering_2     ", "Sub_metering_3     "),cex=0.5)

## top right
plot(household_power_consumption$DT,household_power_consumption$Voltage,type="l",xlab="datetime",ylab="Voltage")

## bottom right
plot(household_power_consumption$DT,household_power_consumption$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")
axis(side=2, at=c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6))

dev.copy(png, file = "plot4.png", width=480, height=480, units="px")
dev.off()

