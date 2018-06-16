# ***Saving and reading files***
library(tidyverse)
setwd("~/Desktop/my_directory")

# Create three objects
x <- 1:10
my_iris <- iris
my_mtcars <- mtcars

# Save as csv
write_csv(my_iris, "my_iris.csv")
write_csv(x, "x.csv") # doesn't work

my_iris <- read_csv("my_iris.csv")

# Save as rds
saveRDS(x, "x.rds")
y <- readRDS("x.rds")
x
y

# Save everything (all objects)
save.image("everything.Rdata")

load("everything.Rdata")

# One thing, flexible: write_csv() and read_csv()
# One thing, just R: saveRDS() and readRDS()
# Save everything save.image() and load()
