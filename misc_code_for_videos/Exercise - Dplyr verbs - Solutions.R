# Purpose: Get familiar with the dyplr verbs filter, select, arrange, mutate,
# group_by, and summarize

# Reference: http://r4ds.had.co.nz/transform.html#introduction

# Preparation: Created a smaller dataframe
mtcars$name <- row.names(mtcars)

data <- mtcars %>% 
  slice(1:10) %>% 
  select(name, am, cyl, wt, mpg)

# Example: Find cars wtih a manual transmission (am is 1)
data %>% 
  filter(am == 1)

# 1. Find cars with weight over 3 thousand pounds
data %>% 
  filter(wt > 3)

# 2. Find cars with mpg less than or equal to 21
data %>% 
  filter(mpg <= 21)

# 3. Sort the cars from lowest to highest weight
data %>% 
  arrange(wt)

# 4. Sort the cars from highest to lowest weight
data %>% 
  arrange(desc(wt))

# 5. Find cars with 6 cylinders, and sort from best to worst gas efficiency
data %>% 
  filter(cyl == 6) %>% 
  arrange(desc(mpg))

# 6. Show just the name and wt variables
data %>% 
  select(name, wt)

# 7. Remove the am variable
data %>% 
  select(-am)

# 8. Show just the name and mpg variables for cars with 8 cylinders
data %>% 
  filter(cyl == 8) %>% 
  select(name, mpg)

# 9. Create a new variable called wt_times_mpg that is weight multipled by mpg
data %>% 
  mutate(wt_times_mpg = wt * mpg)

# 10. wt is actually in thousands of pounds. Change it to pounds. 
# For example, the first weight should be 2620
data %>% 
  mutate(wt = wt * 1000)

# 11. Show just the names of cars where weight multipled by mpg is greater than
# 65.
data %>% 
  filter(wt * mpg > 65)

# 12. Find the mean mpg of all of the cars
data %>% 
  summarize(mean_mpg = mean(mpg))

# 13. Find the mean wt for each 4, 6, and 8 cylinder cars
data %>% 
  group_by(cyl) %>% 
  summarize(mean_mpg = mean(mpg))

# 14. Reorder the columns so they are in alphabetical order (am first, wt last)
data %>% 
  select(am, cyl, mpg, name, wt)

# 15. Find cars with 4 or 8 cylinders
data %>% 
  filter(cyl %in% c(4, 8))

# 16. Remove the name and am columns, and rename the wt column weight
data %>% 
  select(-name, -am, weight = wt)

# 17. Find the mean mpg for each type of transmission (am)
data %>% 
  group_by(am) %>% 
  summarize(mean_mpg = mean(mpg))

# 18. Find cars with 4 or 8 cylinders, greater than 21 mpg, and wt below
# 3 thousand pounds
data %>% 
  filter(cyl %in% c(4, 8), mpg > 21, wt < 3)

# 19. How many cars have 4 cylinders? 6? 8?
data %>% 
  group_by(cyl) %>% 
  summarise(number_of_cars = n())

data %>% 
  count(cyl)

# 20. Make a dataframe that shows the mean of mpg, sd of mpg, and count
# for each level of am 
data %>% 
  group_by(am) %>% 
  summarize(mean_mpg = mean(mpg),
            sd_mpg = sd(mpg),
            number_of_cars = n())

# 21. Filter to cars with 6 cylinders, arrange by am and then mpg, create
# a new variable called heavy that is TRUE/FALSE for if a car weights over
# 3 thousand pounds, and remove the cyl column
data %>% 
  filter(cyl == 6) %>% 
  arrange(am, mpg) %>% 
  mutate(heavy = wt > 3) %>% 
  select(-cyl)