##################
### Purpose: Understand grouby and how it can be used with the other dplyr verbs
##################

# Preparation: Let's create a small dataframe to work with --------------------
library(tidyverse)

mtcars$name <- row.names(mtcars)

mtcars <- mtcars %>% 
  slice(1:10) %>% 
  select(name, transmission = am, cylinders = cyl, weight = wt, mpg) %>% 
  mutate(transmission = if_else(transmission == 1, "manual", "automatic")) %>% 
  arrange(transmission, mpg) %>% 
  slice(c(1:3, 8:10))

mtcars %>% write_csv("~/Desktop/mtcars_small.csv")

# Example: explain what the following code is doing -----------------------
mtcars %>% 
  group_by(transmission) %>% 
  summarise(mean_weight = mean(weight),
            count = n())

# Note it's a good idea to look at mtcars before and after. By doing so
# we see that for each of the transmission values -- automatic and manual, 
# we are finding the mean weight and the number of cars there

# Part A: Explain what each of the following blocks of code do ------------
# 1. 
mtcars %>% 
  group_by(cylinders) %>% 
  summarize(min_mpg = min(mpg),
            max_mpg = max(mpg),
            median_weight = median(weight))

# 2.
mtcars %>% 
  group_by(transmission) %>% 
  mutate(centered_mpg = mpg - mean(mpg))

# 3.
mtcars %>% 
  group_by(transmission) %>% 
  filter(n() == 3)

# Part B: --------------
# Above you saw what an example of groupby with summarize, mutate, and filter.
# Use each of these on mtcars but in a different way.



# Part C ------------------------------------------------------------------
# Install data and make a simple dataframe
install.packages("gapminder")
library(gapminder)

basic_gapminder <- gapminder %>% 
  filter(year %in% 1990:2010, country %in% c("Brazil", "Argentina", "Chile"))

# Example: Find the average population in each of these 2 countries over these years
basic_gapminder %>% 
  group_by(country) %>% 
  summarize(mean_pop = mean(pop))

# 1. For each country, find the year with the lowest gdpPercap


# 2. Make a new variable, pop_centered, that is the pop relative to the mean
# for that country


# 3. Filter to only show countries where the max lifeExp has exceeded 75


# 4. Make a new variable, pop_growth, that is the percent increase in population
# since 1992 for that country


# 5. Filter to only show the row for each country where 


# 6. Find the mean gdpPercap across countries in 1992, 1997, and 2002