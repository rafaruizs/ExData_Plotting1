#Reading the Data
file <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(file) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# Plot 4

# use hourly data
file <- cbind(file,dateTime=strptime(paste(file$Date,file$Time), format="%d/%m/%Y %H:%M:%S"))

#Opens device PNG
png(file="./plot4.png",width=480,height=480)

#Create the matrix for the 4 graphics
par(mfcol = c(2,2))
#Plots
with (file, {
        
        #plot4.1
        plot( dateTime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
        
        #plot4.2     
        plot(dateTime,Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
        lines (x= file$dateTime, y= file$Sub_metering_2, col ="red")
        lines (x= file$dateTime, y= file$Sub_metering_3, col ="blue")
        legend("topright" , 
               c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1), # gives the legend appropriate symbols (lines)
               bty="n",
               lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))
        
        #plot4.3
        plot( dateTime, Voltage, type = "l",xlab = "datetime")

        #plot4.4
        plot(dateTime,Global_reactive_power, type ='l', xlab ="datetime")
        
})        
dev.off()

