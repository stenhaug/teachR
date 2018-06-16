# ***Workspaces***

library(tidyverse)

# Directory is the folder you're working in

# Setting and getting directory

### Can point and click

### Can type

setwd("~/Desktop/my_directory")
setwd("/Users/benastenhaug/Desktop/my_directory")

### Getting directory

getwd()

# Saving to the directory
my_mtcars <- mtcars

write_csv(my_mtcars, "my_mtcars.csv")

my_mtcars #delete it first

# Reading from the directory
my_mtcars <- read_csv("my_mtcars.csv")

# What if I want to use a different folder or a subdirectory?
my_iris <- iris

write_csv(my_iris, "~/Desktop/my_directory/my_sub_directory/my_iris.csv")
write_csv(my_iris, "/Users/benastenhaug/Desktop/my_directory/my_iris.csv")

my_iris <- read_csv("my_iris.csv")
my_iris <- read_csv("~/Desktop/my_directory/my_sub_directory/my_iris.csv")

