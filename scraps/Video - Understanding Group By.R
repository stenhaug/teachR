library(tidyverse)

data <- tribble(~name, ~score,
                "Jen",    8,
                "Jen",   10,
                "Sarah",  5,
                "Sarah",  7,
                "Ben",    4,
                "Ben",    5,
                "Ben",    6,)

# basic verbs
data %>% filter(score > 6)

data %>% mutate(score_plus_one = score + 1)
data %>% mutate(score_centered = score - mean(score))

data %>% summarize(mean(score), sd(score))

# group by
data %>% 
    group_by(name) %>% 
    summarize(mean(score))

data %>% 
    group_by(name) %>% 
    mutate(mean = mean(score))

data %>% 
    group_by(name) %>% 
    mutate(mean = mean(score)) %>% 
    filter(mean > 7)

data %>% 
    group_by(name) %>% 
    filter(mean(score) > 7)

data %>% 
    group_by(name) %>% 
    filter(n() == 2)
