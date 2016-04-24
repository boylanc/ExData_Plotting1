household_power_consumption <- read.csv("household_power_consumption_sub.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")
household_power_consumption$DT_Str <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$DT <- strptime(household_power_consumption$DT_Str, format='%d/%m/%Y %H:%M:%S')

plot(household_power_consumption$DT, household_power_consumption$Global_active_power, type="n", xlab=" ", ylab="Global Active Power (Kilowatts)", ylim=c(0, 8), yaxt="n")
axis(side=2, at=c(0, 2, 4, 6))
lines(household_power_consumption$DT, household_power_consumption$Global_active_power, xlab=" ", ylab="Global Active Power (Kilowatts)", ylim=c(0, 8), yaxt="n")

dev.copy(png, file = "plot2.png", width=480, height=480, units="px")
dev.off()
