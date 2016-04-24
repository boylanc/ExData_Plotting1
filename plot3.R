household_power_consumption <- read.csv("household_power_consumption_sub.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")
household_power_consumption$DT_Str <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DT <- strptime(household_power_consumption$DT_Str, format='%d/%m/%Y %H:%M:%S')

plot(household_power_consumption$DT, household_power_consumption$Sub_metering_1, type='l', xlab=" ", ylab="Energy sub metering", ylim=c(0, 40), yaxt="n")
axis(side=2, at=c(0, 10, 20, 30))
#lines(household_power_consumption$DT, household_power_consumption$Sub_metering_1)
lines(household_power_consumption$DT, household_power_consumption$Sub_metering_2, col="red")
lines(household_power_consumption$DT, household_power_consumption$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red" ,"blue"), legend = c("Sub_metering_1         ", "Sub_metering_2     ", "Sub_metering_3     "),cex=0.7)

dev.copy(png, file = "plot3.png", width=480, height=480, units="px")
dev.off()

