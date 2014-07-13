#Reading the Data
file <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(file) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# Plot 2

# use hourly data
file <- cbind(file,dateTime=strptime(paste(file$Date,file$Time), format="%d/%m/%Y %H:%M:%S"))

#Opens device PNG
png(file="./plot2.png",width=480,height=480)

with(file,plot(dateTime,Global_active_power,
               ylab = "Global Active Power (kilowatts)",
               xlab = " ",
               type = "l"))

dev.off()

