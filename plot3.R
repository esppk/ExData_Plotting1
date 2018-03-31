library(tidyverse)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                       Time = col_time(format = "%H:%M:%S")), 
                                          trim_ws = TRUE)

hpc <- household_power_consumption %>% filter(Date<= lubridate::ymd('2007-02-02')) %>% 
    filter(Date >= lubridate::ymd('2007-02-01'))

#plot3
png("plot3.png")
plot(hpc$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering", axes = F)
lines(hpc$Sub_metering_2, col = "red")
lines(hpc$Sub_metering_3, col = "blue")
legend("topright", legend = paste0(c("Sub_metering_"), 1:3), 
       lty = "solid", col = c("black","red", "blue"), cex = 1)
axis(1,c(1, 1500, 2880), c("Thu", "Fri", "Sat"))
axis(2)
box()
dev.off()

