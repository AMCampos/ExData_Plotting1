# We must ensure that the dplyr package is allready installed
require(dplyr)
#library(dplyr)
# We read the file with the data 
types <- c("character","character","numeric","numeric","numeric","numeric","character","character","character")
d1 <- read.csv2("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, colClasses = types, dec = ".", na.strings = "?")
# Now, we select the rows we need
d2 <- filter(d1, Date=="1/2/2007" | Date=="2/2/2007")
# Now, we add a new column with the Date in date format, and 
# later, we do the same with Global_active... we need to parse
# to a numerical format
d2 <- mutate(d2, DateDt = as.Date(Date, "%d/%m/%Y"))
#d2 <- mutate(d2, Gapw = as.numeric(Global_active_power))
png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(d2, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()
