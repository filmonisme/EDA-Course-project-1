
# load data
houseHold <- as.data.frame(read.table ("household_power_consumption.txt", sep = ";", header = TRUE))
houseHold <- houseHold[as.character(houseHold$Date) == "1/2/2007" | as.character(houseHold$Date) == "2/2/2007", ]

houseHold$Time = strptime(paste(houseHold[,1],houseHold[,2]),"%d/%m/%Y %H:%M:%S")

# Assign variables and check for any "?"
X <- as.character(houseHold[,3])
X <- as.numeric(X[!X == "?"])

png ("plot1.png")
hist(X, breaks=11, xlab="Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
