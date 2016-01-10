## Import File
data <- read.table("./household_power_consumption.txt", header= TRUE, sep = ";", stringsAsFactors = FALSE, dec=".")

## Subset Data to 2/1/2007 - 2/2/2007
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Remove annoying as numeric error
GAP <- as.numeric(datasubset$Global_active_power)

## Plot histogram
histogram <- hist(GAP, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
                  ylab = "Frequency", col="Red")

## Save Plot to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()