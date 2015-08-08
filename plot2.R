
# load data 
houseHold <- as.data.frame(read.table ("household_power_consumption.txt", sep = ";", header = TRUE))
houseHold <- houseHold[as.character(houseHold$Date) == "1/2/2007" | as.character(houseHold$Date) == "2/2/2007", ]

houseHold$Time = strptime(paste(houseHold[,1],houseHold[,2]),"%d/%m/%Y %H:%M:%S")

# Assign variables and check for any "?"
Y <- as.character(houseHold[,3])
X <- houseHold[,2]
X <- X[!Y == "?"]
Y <- as.numeric(Y[!Y == "?"])

png ("plot2.png")
plot (X,Y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
