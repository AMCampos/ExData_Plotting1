### Plot number 4
#######################################################
##
require(dplyr)
types <- c("character","character","numeric","numeric","numeric","numeric","character","character","character")
d1 <- read.csv2("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, colClasses = types, dec = ".", na.strings = "?")
d2 <- filter(d1, Date=="1/2/2007" | Date=="2/2/2007")
fecha <- strptime(paste(d2$Date, d2$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")
d2 <- cbind.data.frame(d2,fecha)
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2), cex=0.7)
# Gráfico 1
with(d2, plot(fecha,Global_active_power, type="l",xlab = "", ylab="Global_active_power"))
# Gráfico 2
with(d2, plot(fecha,Voltage, type = "l", ylab="Voltage", xlab = "datetime"))
# Gráfico 3
with(d2, {
     plot(fecha, Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
     lines(fecha, Sub_metering_2, col="red")
     lines(fecha, Sub_metering_3, col="blue")
})
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, bty="n", col=c("black", "red", "blue"), lty = 1)
# Gráfico 4
with(d2, plot(fecha, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()
