library(tidyverse)
mtcars$name <- row.names(mtcars)
mtcars <- mtcars[1:10, ] %>% 
  select(name, mpg, cyl, am) %>% 
  as_data_frame()
