## Import File
data <- read.table("./household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

## Subset Data to 2/1/2007 - 2/2/2007
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Convert Time
DOW <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Remove annoying as numeric error
GAP <- as.numeric(datasubset$Global_active_power)
sm1 <- as.numeric(datasubset$Sub_metering_1)
sm2 <- as.numeric(datasubset$Sub_metering_2)
sm3 <- as.numeric(datasubset$Sub_metering_3)
GRP <- as.numeric(datasubset$Global_reactive_power)
voltage <- as.numeric(datasubset$Voltage)

## Plot graph
par(mfrow = c(2, 2))

## 1st
plot(DOW, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

## 2nd
plot(DOW, voltage, type="l", xlab="datetime", ylab="Voltage")

## 3rd
plot(DOW, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(DOW, sm2, type="l", col="red")
lines(DOW, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

## 4th
plot(DOW, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save plot to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()