library(tidyverse)
library(microbenchmarkCore)

time_for_median_of_n_numbers <- function(n){
    scramble <- sample(n)
    run <- microbenchmark(median(scramble))
    median(run$time[-(1:5)]) / 1000000
}

data <- 
    tibble(
        n = seq(1000, 100000, by = 1000)
    ) %>% 
    mutate(
        time = n %>% map_dbl(time_for_median_of_n_numbers)
    )

data %>% 
    ggplot(aes(x = n, y = time)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    labs(
        x = "Number of numbers to take median of",
        y = "Seconds"
    )