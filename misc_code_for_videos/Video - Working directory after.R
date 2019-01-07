# ***Working Directory***

library(tidyverse)

setwd("~/Desktop/my_directory")

setwd("/Users/benastenhaug/Desktop/my_directory")
getwd()

# Save data to your directory
my_mtcars <- mtcars
my_mtcars

write_csv(my_mtcars, "my_mtcars.csv")

# Read data from your directory
my_mtcars

my_mtcars <- read_csv("my_mtcars.csv")

# What if there is a subdirectory?
my_iris <- iris

write_csv(my_iris, "~/Desktop/my_directory/my_sub_directory/my_iris.csv")

my_iris <- read_csv("~/Desktop/my_directory/my_sub_directory/my_iris.csv")

my_iris

