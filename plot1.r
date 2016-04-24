
household_power_consumption <- read.csv("household_power_consumption_sub.txt", header=TRUE, stringsAsFactors=FALSE, sep=";")
household_power_consumption$Global_active_power <- as.numeric(household_power_consumption$Global_active_power)

hist(household_power_consumption$Global_active_power, col = "Red", main="Global Active Power", xlab="Global Active Power (Kilowatts)", xlim=c(0, 8), xaxt="n")
axis(side=1, at=c(0, 2, 4, 6))

dev.copy(png, file = "plot1.png", width=480, height=480, units="px")
dev.off()
