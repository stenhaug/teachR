# ****The 5 verbs of dplyr***
library(tidyverse)
mtcars
# 1. filter
mtcars %>% 
  filter(mpg > 21 | cyl == 6)
# 2. select
mtcars %>% 
  select(cyl, everything())

# 3. arrange
mtcars %>% 
  arrange(cyl, mpg)

# 4. mutate
mtcars %>% 
  mutate(mpg_times_cyl = mpg * cyl,
         is_six_cyl = cyl == 6)

# 5. group_by/summarize
mtcars %>% 
  group_by(cyl) %>% 
  summarise(mean_mpg = mean(mpg),
            count = n())

# combining
mtcars %>% 
  select(-am) %>% 
  filter(mpg < 20) %>% 
  mutate(mpg_times_10 = mpg * 10) %>% 
  arrange(cyl, mpg, name)
