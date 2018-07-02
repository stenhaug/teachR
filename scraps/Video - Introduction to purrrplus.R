# devtools::install_github("stenhaug/purrrplus")
library(purrrplus)
library(tidyverse)

# example function
calculate_if_positive <- function(a, b){
    if(a < 0 & b < 0) {stop("Both numbers are negative.")}
    else if(a < 0) {stop("Just the first number is negative")}
    else if(b < 0) {stop("Just the second number is negative")}
    
    list(add = a + b,
         subtract = a - b,
         multiply = a * b,
         divide = a / b)
}

# example data frame
numbers <- data_frame(a = c(-1, 0, 1, 2),
                      b = c(2, 1, 0, -1),
                      irrelevant = c("minneapolis", "st_paul", "minneapolis", "st_paul"))


# OLD WAY
numbers %>% select(-irrelevant) %>% pmap(calculate_if_positive)

output <- numbers %>% select(-irrelevant) %>% pmap(safely(calculate_if_positive))

glimpse(output)

# NEW WAY
output <- numbers %>% pmap_safely(calculate_if_positive)

output %>% get_errors()

output %>% get_errors(specific = TRUE)

output$result[[2]]

output %>% get_results()

