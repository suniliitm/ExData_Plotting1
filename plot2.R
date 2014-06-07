# Read power data
power_data = read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?",nrows=2075259 ,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Format Date
power_data$Date = as.Date(power_data$Date, format = "%d/%m/%Y")

# Subset data only for 2007-02-01 and 2007-02-02
power_data_subset = subset(power_data,Date=="2007-02-01" | Date=="2007-02-02")

# Format Date and Time
x_data = strptime(paste(power_data_subset$Date,power_data_subset$Time),"%Y-%m-%d %H:%M:%S")

# Open png device
png(filename = "plot2.png")

# Plotting
plot(x_data,power_data_subset$Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()