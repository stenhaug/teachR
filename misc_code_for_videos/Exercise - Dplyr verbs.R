# Purpose: Get familiar with the dyplr verbs filter, select, arrange, mutate,
# group_by, and summarize

# Reference: http://r4ds.had.co.nz/transform.html#introduction

# Preparation: Created a smaller dataframe called data that we'll use
mtcars$name <- row.names(mtcars)

data <- mtcars %>% 
  slice(1:10) %>% 
  select(name, am, cyl, wt, mpg)

# Example: Find cars wtih a manual transmission (am is 1)
data %>% 
  filter(am == 1)

# 1. Find cars with weight over 3 thousand pounds

# 2. Find cars with mpg less than or equal to 21

# 3. Sort the cars from lowest to highest weight

# 4. Sort the cars from highest to lowest weight

# 5. Find cars with 6 cylinders, and sort from best to worst gas efficiency

# 6. Show just the name and wt variables

# 7. Remove the am variable

# 8. Show just the name and mpg variables for cars with 8 cylinders

# 9. Create a new variable called wt_times_mpg that is weight multipled by mpg

# 10. wt is actually in thousands of pounds. Change it to pounds. 
# For example, the first weight should be 2620

# 11. Show just the names of cars where weight multipled by mpg is greater than
# 65.

# 12. Find the mean mpg of all of the cars

# 13. Find the mean wt for each 4, 6, and 8 cylinder cars

# 14. Reorder the columns so they are in alphabetical order (am first, wt last)

# 15. Find cars with 4 or 8 cylinders

# 16. Remove the name and am columns, and rename the wt column weight

# 17. Find the mean mpg for each type of transmission (am)

# 18. Find cars with 4 or 8 cylinders, greater than 21 mpg, and wt below
# 3 thousand pounds

# 19. How many cars have 4 cylinders? 6? 8?

# 20. Make a dataframe that shows the mean of mpg, sd of mpg, and count
# for each level of am 

# 21. Filter to cars with 6 cylinders, arrange by am and then mpg, create
# a new variable called heavy that is TRUE/FALSE for if a car weights over
# 3 thousand pounds, and remove the cyl column
