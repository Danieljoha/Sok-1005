library(tidyverse)
library(readr)
library(lubridate)
test <- read_table("http://vortex.nsstc.uah.edu/data/msu/v6.0/tlt/uahncdc_lt_6.0.txt")
test <- sapply(test, as.numeric)
test <- as_tibble(test)


test1 <- test %>% 
  mutate(date = ym(paste(Year, Mo)))
test1 <- test1 %>% 
  select(date, everything())


test1 %>% 
  ggplot(aes(x=date, y=Globe))+
  geom_line()
