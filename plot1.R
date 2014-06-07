# Read power data
power_data = read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?",nrows=2075259 ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Format Date
power_data$Date = as.Date(power_data$Date, format = "%d/%m/%Y")

# Subset data only for 2007-02-01 and 2007-02-02
power_data_subset = subset(power_data,Date=="2007-02-01" | Date=="2007-02-02")

# Open png device
png(filename = "plot1.png")

# Histogram plotting
hist(power_data_subset$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()