library(tidyverse)
library(modelr)

# make some sample data
the_data <- 
    tibble(
        day = c("Mon", "Tues", "Mon", "Tue", "Mon", "Tue"),
        used = c(1, 2, 3, 4, 5, 6)
    )

# fit a model
model <- lm(used ~ day, data = the_data)

# look at the model
broom::tidy(model)

# use modelr to easily add predictions and residuals
the_data %>%
    add_predictions(model) %>% 
    add_residuals(model)
