# ***Saving and reading files***

library(tidyverse)

setwd("~/Desktop/my_directory")

# Play with settings

# Let's create three objects
x <- 1:10  
my_iris <- iris
my_mtcars <- mtcars

# Saving as a csv
write_csv(my_iris, "my_iris.csv")
write_csv(x, "x.csv")

# Saving as an rds file
saveRDS(x, file = "x.rds")

# Can save everything
save.image("everything.Rdata")

# What do things look like when we load them?
my_iris <- read_csv("my_iris.csv")
x <- read_rds("x.Rds")

load("everything.Rdata")

# Takeaways:
## 1. Don't rely on autosave (shut this off)
## 2. When saving an R object use saveRDS and read_rds because you can get names
## 3. To save everything, use save.image() and load()
