# ***Vectors, dataframes, and lists*** 
library(tidyverse)

mtcars <- as_data_frame(mtcars)

# Dataframes are made of vectors
mtcars
mtcars$gear
mtcars$gear %>% length()
mtcars$carb
mtcars$carb %>% length()

# We can create a dataframe from vectors
x <- c(4, 7, 8, 2)
y <- 1:4

data <- data_frame(x, y)
data

data$x
data$y

# Side note: even one number is a vector
x <- 3
y <- 2

data_frame(x, y)

# Lists... what if my vectors aren't the same length?
w <- c(4, 5, 2, 1)
z <- 1:10

w
z

data_frame(w, z)

my_list <- list(w, z)

my_list

my_list[[1]]
my_list[[2]]
