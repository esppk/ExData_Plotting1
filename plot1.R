library(tidyverse)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                       Time = col_time(format = "%H:%M:%S")), 
                                          trim_ws = TRUE)

hpc <- household_power_consumption %>% filter(Date<= lubridate::ymd('2007-02-02')) %>% 
                        filter(Date >= lubridate::ymd('2007-02-01'))
#plot1
png("plot1.png")
with(hpc,
     hist(Global_active_power, 
          xlab = "Global Active Power (kilowatts)",
          col = "red", main = "Global Active Power")  
)
dev.off()
