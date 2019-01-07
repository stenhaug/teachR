#### Exercise 5.2.4: Find all flights that...

library(tidyverse)
library(nycflights13)

# verbs: filter

# 1. Had an arrival delay of two or more hours
flights %>% 
  filter(arr_delay >= 2)

# 2. Flew to Houston (IAH or HOU)
### works
flights %>% 
  filter(dest == "IAH" | dest == "HOU")

### preferred 
flights %>% 
  filter(dest %in% c("IAH", "HOU"))

# 3. Were operated by United, American, or Delta
### look at the carrier codes
flights$carrier %>% unique()

### write the filter statement
flights %>% 
  filter(carrier %in% c("UA", "AA", "DL"))

# 4. Departed in summer (July, August, and September)
flights %>% 
  filter(month %in% c(6, 7, 8))

flights %>% 
  filter(month %in% 6:8)

# 5. Arrived more than two hours late, but didn’t leave late
flights %>% 
  filter(arr_delay >= 120 & dep_delay <= 0)

flights %>% 
  filter(arr_delay >= 120, dep_delay <= 0)

# 6. Were delayed by at least an hour, but made up over 30 minutes in flight

flights %>% 
  filter(dep_delay >= 60, dep_delay - arr_delay >= 30)

# 7. Departed between midnight and 6am (inclusive)
flights %>% 
  filter(dep_time <= 600 | dep_time == 2400) %>% 
  View()
