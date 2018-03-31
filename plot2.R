library(tidyverse)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                       Time = col_time(format = "%H:%M:%S")), 
                                          trim_ws = TRUE)

hpc <- household_power_consumption %>% filter(Date<= lubridate::ymd('2007-02-02')) %>% 
    filter(Date >= lubridate::ymd('2007-02-01'))

#plot2
png("plot2.png")
par(mar = c(3,4,2,1))
plot(hpc$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)", axes = F)
axis(1,c(1, 1500, 2880), c("Thu", "Fri", "Sat"))
axis(2)
box()
dev.off()
