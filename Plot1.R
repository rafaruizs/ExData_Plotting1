#Reading the Data
file <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(file) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# Plot 1
#Opens device PNG
png(file="./plot1.png",width=480,height=480)

hist(file$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()

