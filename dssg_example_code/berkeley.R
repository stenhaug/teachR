library(tidyverse)

# data
data <- 
    tribble(
        ~dept, ~male_applied, ~male_admit_rate, ~female_applied, ~female_admit_rate,
        "berkeley", 8442, 0.44, 4321, 0.35,
        "a", 825, 0.62, 108, 0.82,
        "b", 560, 0.63, 25, 0.68,
        "c", 325, 0.37, 593, 0.34,
        "d", 417, 0.33, 375, 0.35,
        "e", 191, 0.28, 393, 0.24,
        "f", 373, 0.06, 341, 0.07
    ) %>% 
    slice(-1)

# help function to make data long
row_to_long_dataframe <- 
    function(dept, male_applied, male_admit_rate, female_applied, female_admit_rate){
        bind_rows(
            tibble(dept = dept, sex = "male", admit = 1) %>% 
                slice(rep(1, male_applied * male_admit_rate)),
            
            tibble(dept = dept, sex = "male", admit = 0) %>% 
                slice(rep(1, male_applied * (1 - male_admit_rate))),
            
            tibble(dept = dept, sex = "female", admit = 1) %>% 
                slice(rep(1, female_applied * female_admit_rate)),
            
            tibble(dept = dept, sex = "female", admit = 0) %>% 
                slice(rep(1, female_applied * (1 - female_admit_rate)))
        )
    }

# make data long    
full_data_long <- 
    data %>% 
    pmap(row_to_long_dataframe) %>% 
    bind_rows()

# fit a model and inspect
logistic_model_without_sex <- glm(admit ~ dept, family = "binomial", data = full_data_long)

logistic_model_with_sex <- glm(admit ~ dept + sex, family = "binomial", data = full_data_long)

logistic_model_with_sex_interacted <- glm(admit ~ dept * sex, family = "binomial", data = full_data_long)

broom::tidy(logistic_model_with_sex_interacted)

anova(logistic_model_without_sex, logistic_model_with_sex_interacted, test = "LRT")

# emily makes the point that the way these factors are setup is confusing to interpret. there is a way to make it better using contrasts or something. she will find link and send it.
# here emily provides a link for how to fix this: https://stats.stackexchange.com/questions/94010/understanding-dummy-manual-or-automated-variable-creation-in-glm

# mike says in general (but not in this case) that he would just do the model independently for each department because if we carry over information across groups when it isn't appropriate (e.g. hetergogeneity in variances) then we can get invalid conclusions

# ben says that it's easy to think about everything as a regression problem. mike says he doesn't like that because he wants flexibility to think about seperate groups and fine grain control such as thinking about hetergeonity in variance and model misfit and how this could vary by group

