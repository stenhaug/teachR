# ***Map functions in purrr***
library(tidyverse)

my_list <- list(
  c(1, 2, 6),
  c(4, 7, 1),
  c(9, 1, 5)
)

# find the mean of each element
my_list[[1]] %>% mean()
my_list[[2]] %>% mean()
my_list[[3]] %>% mean()


# basic idea of a map (general)
my_list

my_list %>% map(mean)

# specific map
my_list %>% map_dbl(mean)

# anonymous function
my_list %>% map(~ . * 2)

# other maps
my_list %>% map(is.numeric)
my_list %>% map_lgl(is.numeric)

my_list %>% map_chr(is.numeric)

my_list %>% map_int(is.numeric)
