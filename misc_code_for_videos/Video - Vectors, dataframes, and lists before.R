# ***Dataframes and vectors*** 
library(tidyverse)

# dataframes are made of vectors
mtcars
mtcars$name
mtcars$name %>% length()

mtcars$mpg
mtcars$mpg %>% length()
mtcars$mpg %>% mean()

# we can create a dataframe if we have vectors
x <- c(4, 7, 8, 2)
y <- 1:4

data_frame(x, y)

# connect things that aren't vectors of the same length
w <- c(1, 4, 5, 2)
z <- 1:5

data_frame(w, z)
list(w, z)