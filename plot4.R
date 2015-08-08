
# loadind data
houseHold <- as.data.frame(read.table ("household_power_consumption.txt", sep = ";", header = TRUE))
houseHold <- houseHold[as.character(houseHold$Date) == "1/2/2007" | as.character(houseHold$Date) == "2/2/2007", ]

houseHold$Time = strptime(paste(houseHold[,1],houseHold[,2]),"%d/%m/%Y %H:%M:%S")

png ("plot4_2.png")  # OPEN PNG FILE

# GENERATE FIRST PLOT
par (mfrow =c(2,2))
Y <- as.character(houseHold[,3])
X <- houseHold[,2]
X <- X[!Y == "?"]
Y <- as.numeric(Y[!Y == "?"])

plot (X,Y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# GENERATE SECOND PLOT
Y <- as.character(houseHold[,5])
X <- houseHold[,2]
X <- X[!Y == "?"]
Y <- as.numeric(Y[!Y == "?"])

plot (X,Y, type="l", xlab="datetime", ylab="Voltage")

# GENERATE THIRD PLOT
Y1 <- as.character(houseHold[,7])
X1 <- houseHold[,2]
X1 <- X1[!Y1 == "?"]
Y1 <- as.numeric(Y1[!Y1 == "?"])

Y2 <- as.character(houseHold[,8])
X2 <- houseHold[,2]
X2 <- X2[!Y2 == "?"]
Y2 <- as.numeric(Y2[!Y2 == "?"])

Y3 <- as.character(houseHold[,9])
X3 <- houseHold[,2]
X3 <- X3[!Y3 == "?"]
Y3 <- as.numeric(Y3[!Y3 == "?"])

plot (X1,Y1, type="l", xlab="", ylab="Energy sub meeting")
lines (X2,Y2, col="red")
lines (X3,Y3, col="blue")
legend ("topright", col=c("black","red","blue"), 
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1, bty="n")

# GENERATE FORTH PLOT
Y <- as.character(houseHold[,4])
X <- houseHold[,2]
X <- X[!Y == "?"]
Y <- as.numeric(Y[!Y == "?"])
plot (X,Y, type="l", xlab="datetime",ylab="Global_reactive_power")

dev.off()  # CLOSE PNG FILE

