##Reading in the data set, then subsetting to just the rows with the required dates.
full_data <- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors=F,na.strings="?")
data <- subset(full_data, (full_data$Date == "1/2/2007" | full_data$Date == "2/2/2007"))

##Removing original data frame, since it is large.
rm(full_data)

##Creating a png file of specified size.
png("plot1.png", width=480, height=480)

##Plot the histogram then write to the png file.
hist(data$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")
dev.off()