library(tidyverse)
library(readr)
library(lubridate)
Temp_data <- read_table("http://vortex.nsstc.uah.edu/data/msu/v6.0/tlt/uahncdc_lt_6.0.txt")
temp <- sapply(Temp_data, as.numeric)
temp <- as_tibble(temp)


temp <- temp[-(530:541),] #får bort skiten på bunnen

temp <- temp %>% 
  mutate(date = ym(paste(Year, Mo)))
temp <- temp %>% 
  select(date, everything())


temp %>% 
  ggplot(aes(x=date, y=Globe))+
  geom_line()

temp1 <- temp %>% 
  aggregate(Globe~Year, FUN=mean)

