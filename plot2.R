##Reading in the data set, then subsetting to just the rows with the required dates.
full_data <- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors=F,na.strings="?")
data <- subset(full_data, (full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"))

##Removing original data frame, since it is large.
rm(full_data)

##Creating a new column that has the date and time combined, for plotting against days.
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

##Creating a png file of specified size.
png("plot2.png", width=480, height=480)

##Plot then write to the png file.
plot(data$DateTime, data$Global_active_power, type="l", lwd=1, ylab="Global Active Power (kilowatts)", xlab="")
dev.off()