## Import File
data <- read.table("./household_power_consumption.txt", header= TRUE, 
                   sep = ";", stringsAsFactors = FALSE, dec=".")

## Subset Data to 2/1/2007 - 2/2/2007
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Convert Time
DOW <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Remove annoying as numeric error
GAP <- as.numeric(datasubset$Global_active_power)

## Plot graph
plot(DOW, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save Plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()