df <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(df) <- name
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
  df[[i]] <- sapply(df[[i]], as.character)
  df[[i]] <- sapply(df[[i]], as.numeric)
}
win.graph(200,200)
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "green", ylim = c(0, 1200))
axis(1, at=c(min(d$DateTime), min(d$DateTime)+86400,  min(d$DateTime)+2*86400),
     labels=c("Thu", "Fri", "Sat"))