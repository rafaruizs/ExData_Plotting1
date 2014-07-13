#Reading the Data
file <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(file) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# Plot 3

# use hourly data
file <- cbind(file,dateTime=strptime(paste(file$Date,file$Time), format="%d/%m/%Y %H:%M:%S"))

#Opens device PNG
png(file="./plot3.png",width=480,height=480)

with(file,plot(dateTime, Sub_metering_1,
               ylab = "Energy sub metering",
               xlab = " ",
               type="l"))
## add additional lines
lines (x= file$dateTime, y= file$Sub_metering_2, col ="red")
lines (x= file$dateTime, y= file$Sub_metering_3, col ="blue")
## Add Legend
legend("topright" , # places a legend at the appropriate place 
       c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       bty="n",
       lwd=c(2.5,2.5,2.5),col=c("black", "red","blue")) # gives the legend lines the correct color and width

dev.off()

