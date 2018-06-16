Solutions - The 5 verbs of dplyr
================
Ben

# Getting started

As always, the first thing we will do is load the tidyverse.

*Note: If you haven’t yet installed the tidyverse, you’ll first have to
run the code install.packages(“tidyverse”).*

``` r
library(tidyverse)
```

Here’s the dataframe that we’ll analyze in this
exercise:

``` r
scores <- data_frame(name = c("mike", "carol", "greg", "marcia", "peter", "jan", "bobby", "cindy", "alice"),
           school = c("south", "south", "south", "south", "north", "north", "north", "south", "south"),
           teacher = c("johnson", "johnson", "johnson", "johnson",  "smith", "smith", "smith", "perry", "perry"),
           gender = c("male", "female", "male", "female", "male", "female", "male", "female", "female"),
           math_score = c(4, 3, 2, 4, 3, 4, 5, 4, 5),
           reading_score = c(1, 5, 2, 4, 5, 4, 1, 5, 4)) 
```

Let’s first take a look at it:

``` r
scores
```

    ## # A tibble: 9 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike   south  johnson male            4             1
    ## 2 carol  south  johnson female          3             5
    ## 3 greg   south  johnson male            2             2
    ## 4 marcia south  johnson female          4             4
    ## 5 peter  north  smith   male            3             5
    ## 6 jan    north  smith   female          4             4
    ## 7 bobby  north  smith   male            5             1
    ## 8 cindy  south  perry   female          4             5
    ## 9 alice  south  perry   female          5             4

Before we get started, I want to make sure you understand the difference
between doing something and assigning it to a new name and just doing it
without naming it. For example, make sure you understand the following:

``` r
# get the first 3 rows
scores %>% 
  slice(1:3)
```

    ## # A tibble: 3 x 6
    ##   name  school teacher gender math_score reading_score
    ##   <chr> <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike  south  johnson male            4             1
    ## 2 carol south  johnson female          3             5
    ## 3 greg  south  johnson male            2             2

``` r
# get the first 3 rows, and assign it to a new name "scores_small"
scores_small <- scores %>% 
  slice(1:3)

# see what's in "scores_small"
scores_small
```

    ## # A tibble: 3 x 6
    ##   name  school teacher gender math_score reading_score
    ##   <chr> <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike  south  johnson male            4             1
    ## 2 carol south  johnson female          3             5
    ## 3 greg  south  johnson male            2             2

In this exercise we’ll typically just print the results and not save
them, but it’s an option if you want it\!

Now we can get to the exercise. Most sections will begin with an example
for you to look at. When questions require a written answer, there will
be an “Answer” line for you to complete.

# Arrange

## Example

**Question:** Sort the data by math\_score from high to low. Who had the
best math score?

``` r
scores %>% 
  arrange(desc(math_score))
```

    ## # A tibble: 9 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 bobby  north  smith   male            5             1
    ## 2 alice  south  perry   female          5             4
    ## 3 mike   south  johnson male            4             1
    ## 4 marcia south  johnson female          4             4
    ## 5 jan    north  smith   female          4             4
    ## 6 cindy  south  perry   female          4             5
    ## 7 carol  south  johnson female          3             5
    ## 8 peter  north  smith   male            3             5
    ## 9 greg   south  johnson male            2             2

**Answer:** Bobby and alice both tied for the highest math score

## Q1

**Question:** Sort the data by name from first to last in the alphabet.

``` r
scores %>% 
  arrange(name)
```

    ## # A tibble: 9 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 alice  south  perry   female          5             4
    ## 2 bobby  north  smith   male            5             1
    ## 3 carol  south  johnson female          3             5
    ## 4 cindy  south  perry   female          4             5
    ## 5 greg   south  johnson male            2             2
    ## 6 jan    north  smith   female          4             4
    ## 7 marcia south  johnson female          4             4
    ## 8 mike   south  johnson male            4             1
    ## 9 peter  north  smith   male            3             5

## Q2

**Question:** Sort the data by gender so females show up first. Which
gender appears to have better reading scores?

``` r
scores %>% 
  arrange(gender)
```

    ## # A tibble: 9 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 carol  south  johnson female          3             5
    ## 2 marcia south  johnson female          4             4
    ## 3 jan    north  smith   female          4             4
    ## 4 cindy  south  perry   female          4             5
    ## 5 alice  south  perry   female          5             4
    ## 6 mike   south  johnson male            4             1
    ## 7 greg   south  johnson male            2             2
    ## 8 peter  north  smith   male            3             5
    ## 9 bobby  north  smith   male            5             1

**Answer:** Females seem to have better reading scores – they all got
either 4 or 5.

## Q3

**Question:** Sort the data by school, then teacher, then gender, then
math\_score, and finally by reading\_score.

``` r
scores %>% 
  arrange(school, teacher, gender, math_score, reading_score)
```

    ## # A tibble: 9 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 jan    north  smith   female          4             4
    ## 2 peter  north  smith   male            3             5
    ## 3 bobby  north  smith   male            5             1
    ## 4 carol  south  johnson female          3             5
    ## 5 marcia south  johnson female          4             4
    ## 6 greg   south  johnson male            2             2
    ## 7 mike   south  johnson male            4             1
    ## 8 cindy  south  perry   female          4             5
    ## 9 alice  south  perry   female          5             4

# Select

## Example

**Question:** Select only the name, math\_score, and reading\_score
columns.

``` r
scores %>% 
  select(name, math_score, reading_score)
```

    ## # A tibble: 9 x 3
    ##   name   math_score reading_score
    ##   <chr>       <dbl>         <dbl>
    ## 1 mike            4             1
    ## 2 carol           3             5
    ## 3 greg            2             2
    ## 4 marcia          4             4
    ## 5 peter           3             5
    ## 6 jan             4             4
    ## 7 bobby           5             1
    ## 8 cindy           4             5
    ## 9 alice           5             4

## Q1

**Question:** Select all of the columns except the gender column.

``` r
scores %>% 
  select(-gender)
```

    ## # A tibble: 9 x 5
    ##   name   school teacher math_score reading_score
    ##   <chr>  <chr>  <chr>        <dbl>         <dbl>
    ## 1 mike   south  johnson          4             1
    ## 2 carol  south  johnson          3             5
    ## 3 greg   south  johnson          2             2
    ## 4 marcia south  johnson          4             4
    ## 5 peter  north  smith            3             5
    ## 6 jan    north  smith            4             4
    ## 7 bobby  north  smith            5             1
    ## 8 cindy  south  perry            4             5
    ## 9 alice  south  perry            5             4

## Q2

**Question:** Select all of the columns except the math\_score and
reading\_score columns.

``` r
scores %>% 
  select(-math_score, -reading_score)
```

    ## # A tibble: 9 x 4
    ##   name   school teacher gender
    ##   <chr>  <chr>  <chr>   <chr> 
    ## 1 mike   south  johnson male  
    ## 2 carol  south  johnson female
    ## 3 greg   south  johnson male  
    ## 4 marcia south  johnson female
    ## 5 peter  north  smith   male  
    ## 6 jan    north  smith   female
    ## 7 bobby  north  smith   male  
    ## 8 cindy  south  perry   female
    ## 9 alice  south  perry   female

## Q3

**Question:** Keep all of the columns but rearrange them so gender is
the first column.

``` r
scores %>% 
  select(gender, everything())
```

    ## # A tibble: 9 x 6
    ##   gender name   school teacher math_score reading_score
    ##   <chr>  <chr>  <chr>  <chr>        <dbl>         <dbl>
    ## 1 male   mike   south  johnson          4             1
    ## 2 female carol  south  johnson          3             5
    ## 3 male   greg   south  johnson          2             2
    ## 4 female marcia south  johnson          4             4
    ## 5 male   peter  north  smith            3             5
    ## 6 female jan    north  smith            4             4
    ## 7 male   bobby  north  smith            5             1
    ## 8 female cindy  south  perry            4             5
    ## 9 female alice  south  perry            5             4

# Filter

## Example

**Question:** Filter to students who are male and went to south.

``` r
# Option 1
scores %>% 
  filter(gender == "male" & school == "south")
```

    ## # A tibble: 2 x 6
    ##   name  school teacher gender math_score reading_score
    ##   <chr> <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike  south  johnson male            4             1
    ## 2 greg  south  johnson male            2             2

``` r
# Option 2
scores %>% 
  filter(gender == "male", school == "south")
```

    ## # A tibble: 2 x 6
    ##   name  school teacher gender math_score reading_score
    ##   <chr> <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike  south  johnson male            4             1
    ## 2 greg  south  johnson male            2             2

## Q1

**Question:** Filter to students who did well in math (you decide what
“well” means).

``` r
scores %>% 
  filter(math_score >= 4)
```

    ## # A tibble: 6 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike   south  johnson male            4             1
    ## 2 marcia south  johnson female          4             4
    ## 3 jan    north  smith   female          4             4
    ## 4 bobby  north  smith   male            5             1
    ## 5 cindy  south  perry   female          4             5
    ## 6 alice  south  perry   female          5             4

## Q2

**Question:** Use filter to figure out how many students had a math
score of 4 or more and a reading score of 3 or more.

``` r
scores %>% 
  filter(math_score >= 4, reading_score >= 3)
```

    ## # A tibble: 4 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 marcia south  johnson female          4             4
    ## 2 jan    north  smith   female          4             4
    ## 3 cindy  south  perry   female          4             5
    ## 4 alice  south  perry   female          5             4

**Answer** There are 4 such students.

## Q3

**Question:** Explain the errors in each of the following code blocks,
then fix it to make it right\!

``` r
# code block 1
scores %>% 
  filter(school == south)
```

    ## Error in filter_impl(.data, quo): Evaluation error: object 'south' not found.

``` r
# code block 2
scores %>% 
  filter(school = "south")
```

    ## Error: `school` (`school = "south"`) must not be named, do you need `==`?

``` r
# fix it! 
scores %>% 
  filter(school == "south")
```

    ## # A tibble: 6 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike   south  johnson male            4             1
    ## 2 carol  south  johnson female          3             5
    ## 3 greg   south  johnson male            2             2
    ## 4 marcia south  johnson female          4             4
    ## 5 cindy  south  perry   female          4             5
    ## 6 alice  south  perry   female          5             4

**Answer:** Code block 1 doesn’t use quotation marks so R thinks it is
looking for an object not a word. Code block 2 uses only one equals sign
“=” when we need two equals signs “==” for comparison.

## Q4

**Question:** You are creating a remediation program. Filter to students
who got a 3 or worse in either math or reading.

``` r
scores %>% 
  filter(math_score <= 3 | reading_score <= 3)
```

    ## # A tibble: 5 x 6
    ##   name  school teacher gender math_score reading_score
    ##   <chr> <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike  south  johnson male            4             1
    ## 2 carol south  johnson female          3             5
    ## 3 greg  south  johnson male            2             2
    ## 4 peter north  smith   male            3             5
    ## 5 bobby north  smith   male            5             1

## Q5

**Question:** Filter to students who got a reading score of 2, 3, or 4.

``` r
# option 1
scores %>% 
  filter(reading_score %in% c(2, 3, 4))
```

    ## # A tibble: 4 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 greg   south  johnson male            2             2
    ## 2 marcia south  johnson female          4             4
    ## 3 jan    north  smith   female          4             4
    ## 4 alice  south  perry   female          5             4

``` r
# option 2 (if you know that 1 and 5 are the only other 2 options)
scores %>% 
  filter(reading_score != 1, reading_score != 5)
```

    ## # A tibble: 4 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 greg   south  johnson male            2             2
    ## 2 marcia south  johnson female          4             4
    ## 3 jan    north  smith   female          4             4
    ## 4 alice  south  perry   female          5             4

## Challenge

**Question:** Filter to students who have a name that starts with an
“m”. Hint: type “?substr” in the console and then scroll to the
bottom of the help file to see useful examples.

``` r
scores %>% 
  filter(substr(name, 1, 1) == "m")
```

    ## # A tibble: 2 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike   south  johnson male            4             1
    ## 2 marcia south  johnson female          4             4

# Filter with groups

## Example

**Question:** Filter to teachers whose best math student got a score of
5.

``` r
scores %>% 
  group_by(teacher) %>% 
  filter(max(math_score) == 5)
```

    ## # A tibble: 5 x 6
    ## # Groups:   teacher [2]
    ##   name  school teacher gender math_score reading_score
    ##   <chr> <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 peter north  smith   male            3             5
    ## 2 jan   north  smith   female          4             4
    ## 3 bobby north  smith   male            5             1
    ## 4 cindy south  perry   female          4             5
    ## 5 alice south  perry   female          5             4

## Q1

**Question:** Filter to the gender with a mean math score of 4.

``` r
scores %>% 
  group_by(gender) %>% 
  filter(mean(math_score) == 4)
```

    ## # A tibble: 5 x 6
    ## # Groups:   gender [1]
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 carol  south  johnson female          3             5
    ## 2 marcia south  johnson female          4             4
    ## 3 jan    north  smith   female          4             4
    ## 4 cindy  south  perry   female          4             5
    ## 5 alice  south  perry   female          5             4

## Q2

**Question:** Explain why the following code removes students who have
perry as their teacher.

``` r
scores %>% 
  group_by(teacher) %>% 
  filter(n() >= 3)
```

    ## # A tibble: 7 x 6
    ## # Groups:   teacher [2]
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike   south  johnson male            4             1
    ## 2 carol  south  johnson female          3             5
    ## 3 greg   south  johnson male            2             2
    ## 4 marcia south  johnson female          4             4
    ## 5 peter  north  smith   male            3             5
    ## 6 jan    north  smith   female          4             4
    ## 7 bobby  north  smith   male            5             1

**Answer:** The “n()” stands for the number of rows. This returns the
teachers with 3 or more rows in the data frame. This excludes perry
because there are only 2 students who have perry as their teacher.

# Mutate

## Example

**Question:** Both the math and reading scores were actually out of 50 –
replace both variables to be 10 times their original values.

``` r
scores %>% 
  mutate(math_score =  math_score * 10,
         reading_score = reading_score * 10)
```

    ## # A tibble: 9 x 6
    ##   name   school teacher gender math_score reading_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>
    ## 1 mike   south  johnson male           40            10
    ## 2 carol  south  johnson female         30            50
    ## 3 greg   south  johnson male           20            20
    ## 4 marcia south  johnson female         40            40
    ## 5 peter  north  smith   male           30            50
    ## 6 jan    north  smith   female         40            40
    ## 7 bobby  north  smith   male           50            10
    ## 8 cindy  south  perry   female         40            50
    ## 9 alice  south  perry   female         50            40

## Q1

**Question:** Create a new column called “math\_reading\_avg” which is
the average of a students math and reading scores.

``` r
scores %>% 
  mutate(math_reading_avg = (math_score + reading_score) / 2)
```

    ## # A tibble: 9 x 7
    ##   name   school teacher gender math_score reading_score math_reading_avg
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>            <dbl>
    ## 1 mike   south  johnson male            4             1              2.5
    ## 2 carol  south  johnson female          3             5              4  
    ## 3 greg   south  johnson male            2             2              2  
    ## 4 marcia south  johnson female          4             4              4  
    ## 5 peter  north  smith   male            3             5              4  
    ## 6 jan    north  smith   female          4             4              4  
    ## 7 bobby  north  smith   male            5             1              3  
    ## 8 cindy  south  perry   female          4             5              4.5
    ## 9 alice  south  perry   female          5             4              4.5

## Q2

**Question:** Create a new column “high\_math\_achiever” that is an
indicator of if a student got a 4 or better on their math\_score.

``` r
scores %>% 
  mutate(high_math_achiever = math_score >= 4)
```

    ## # A tibble: 9 x 7
    ##   name   school teacher gender math_score reading_score high_math_achiever
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl> <lgl>             
    ## 1 mike   south  johnson male            4             1 TRUE              
    ## 2 carol  south  johnson female          3             5 FALSE             
    ## 3 greg   south  johnson male            2             2 FALSE             
    ## 4 marcia south  johnson female          4             4 TRUE              
    ## 5 peter  north  smith   male            3             5 FALSE             
    ## 6 jan    north  smith   female          4             4 TRUE              
    ## 7 bobby  north  smith   male            5             1 TRUE              
    ## 8 cindy  south  perry   female          4             5 TRUE              
    ## 9 alice  south  perry   female          5             4 TRUE

## Q3

**Question:** Create a new column “reading\_score\_centered” that is a
students reading score with the mean of all students’ reading scores
subtracted from it.

``` r
scores %>% 
  mutate(reading_score_centered = reading_score - mean(reading_score))
```

    ## # A tibble: 9 x 7
    ##   name   school teacher gender math_score reading_score reading_score_cen…
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>              <dbl>
    ## 1 mike   south  johnson male            4             1             -2.44 
    ## 2 carol  south  johnson female          3             5              1.56 
    ## 3 greg   south  johnson male            2             2             -1.44 
    ## 4 marcia south  johnson female          4             4              0.556
    ## 5 peter  north  smith   male            3             5              1.56 
    ## 6 jan    north  smith   female          4             4              0.556
    ## 7 bobby  north  smith   male            5             1             -2.44 
    ## 8 cindy  south  perry   female          4             5              1.56 
    ## 9 alice  south  perry   female          5             4              0.556

## Q4

**Question:** Create a new column “science\_score”. You can make up what
the actual scores are\!

``` r
scores %>% 
  mutate(science_score = c(1, 2, 3, 4, 5, 4, 3, 2, 1))
```

    ## # A tibble: 9 x 7
    ##   name   school teacher gender math_score reading_score science_score
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>         <dbl>
    ## 1 mike   south  johnson male            4             1             1
    ## 2 carol  south  johnson female          3             5             2
    ## 3 greg   south  johnson male            2             2             3
    ## 4 marcia south  johnson female          4             4             4
    ## 5 peter  north  smith   male            3             5             5
    ## 6 jan    north  smith   female          4             4             4
    ## 7 bobby  north  smith   male            5             1             3
    ## 8 cindy  south  perry   female          4             5             2
    ## 9 alice  south  perry   female          5             4             1

# Mutate with groups

## Q1

**Question:** Mike and cindy both got a 4 for their math score. Explain
why why Mike has a higher “math\_score\_centered\_by\_gender” score.

``` r
scores %>% 
  group_by(gender) %>% 
  mutate(math_score_centered_by_gender = math_score - mean(math_score))
```

    ## # A tibble: 9 x 7
    ## # Groups:   gender [2]
    ##   name   school teacher gender math_score reading_score math_score_center…
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>              <dbl>
    ## 1 mike   south  johnson male            4             1                0.5
    ## 2 carol  south  johnson female          3             5               -1  
    ## 3 greg   south  johnson male            2             2               -1.5
    ## 4 marcia south  johnson female          4             4                0  
    ## 5 peter  north  smith   male            3             5               -0.5
    ## 6 jan    north  smith   female          4             4                0  
    ## 7 bobby  north  smith   male            5             1                1.5
    ## 8 cindy  south  perry   female          4             5                0  
    ## 9 alice  south  perry   female          5             4                1

**Answer:** We are subtracting the mean math score for that person’s
gender off of their score. Mike has a higher
“math\_score\_centered\_by\_gender” because males did worse on average
on math and so a small number is subtracted off of his score of 4.

## Q2

**Question:** Create a “reading\_score\_centered\_by\_teacher” column.
What can you learn from it?

``` r
scores %>% 
  group_by(teacher) %>% 
  mutate(reading_score_centered_by_teacher = reading_score - mean(reading_score))
```

    ## # A tibble: 9 x 7
    ## # Groups:   teacher [3]
    ##   name   school teacher gender math_score reading_score reading_score_cen…
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>              <dbl>
    ## 1 mike   south  johnson male            4             1             -2    
    ## 2 carol  south  johnson female          3             5              2    
    ## 3 greg   south  johnson male            2             2             -1    
    ## 4 marcia south  johnson female          4             4              1    
    ## 5 peter  north  smith   male            3             5              1.67 
    ## 6 jan    north  smith   female          4             4              0.667
    ## 7 bobby  north  smith   male            5             1             -2.33 
    ## 8 cindy  south  perry   female          4             5              0.5  
    ## 9 alice  south  perry   female          5             4             -0.5

**Answer:** We can learn lots of things\! For example, relative to other
students in their class, bobby did worst on reading and carol did the
best.

## Q3

**Question:** Make a “number\_of\_students\_in\_class” column that is
number of students in a student’s class. For example, it should be 4 for
mike and 3 for peter.

``` r
scores %>% 
  group_by(teacher) %>% 
  mutate(number_of_students_in_class = n())
```

    ## # A tibble: 9 x 7
    ## # Groups:   teacher [3]
    ##   name   school teacher gender math_score reading_score number_of_student…
    ##   <chr>  <chr>  <chr>   <chr>       <dbl>         <dbl>              <int>
    ## 1 mike   south  johnson male            4             1                  4
    ## 2 carol  south  johnson female          3             5                  4
    ## 3 greg   south  johnson male            2             2                  4
    ## 4 marcia south  johnson female          4             4                  4
    ## 5 peter  north  smith   male            3             5                  3
    ## 6 jan    north  smith   female          4             4                  3
    ## 7 bobby  north  smith   male            5             1                  3
    ## 8 cindy  south  perry   female          4             5                  2
    ## 9 alice  south  perry   female          5             4                  2

# Summarize

## Example

**Question:** Use the summarize command to find the mean math score for
all students.

``` r
scores %>% 
  summarize(math_score_mean = mean(math_score))
```

    ## # A tibble: 1 x 1
    ##   math_score_mean
    ##             <dbl>
    ## 1            3.78

## Q1

**Question:** Use the summarize command to find the mean reading score
for all students.

``` r
scores %>% 
  summarize(reading_score_mean = mean(reading_score))
```

    ## # A tibble: 1 x 1
    ##   reading_score_mean
    ##                <dbl>
    ## 1               3.44

## Q2

**Question:** Use the summarize command to find the median for both math
scores and reading scores.

``` r
scores %>% 
  summarize(math_score_median = median(math_score),
            reading_score_median = median(reading_score))
```

    ## # A tibble: 1 x 2
    ##   math_score_median reading_score_median
    ##               <dbl>                <dbl>
    ## 1                 4                    4

## Q3

**Question:** Look closely at the following code. Why is it throwing an
error? How can Rstudio help you see this error?

``` r
scores %>% 
  summarize(math_score_max = max(math_score),
            reading_score_min = min(reading_score)
```

    ## Error: <text>:4:0: unexpected end of input
    ## 2:   summarize(math_score_max = max(math_score),
    ## 3:             reading_score_min = min(reading_score)
    ##   ^

**Answer:** We need another “)” at the end of the code. The first “)” is
for the min function but we also need a “)” to end the summarize
function. Rstudio helps because if you go to the right of a paranthese,
it highlights the corresponding closing paranthese.

# Summarize with groups

## Example

**Question:** Find the minimum math score for each school.

``` r
scores %>% 
  group_by(school) %>% 
  summarize(min_math_score = min(math_score))
```

    ## # A tibble: 2 x 2
    ##   school min_math_score
    ##   <chr>           <dbl>
    ## 1 north               3
    ## 2 south               2

## Q1

**Question:** Find the maximum math score for each teacher.

``` r
scores %>% 
  group_by(teacher) %>% 
  summarize(max_math_score = max(math_score))
```

    ## # A tibble: 3 x 2
    ##   teacher max_math_score
    ##   <chr>            <dbl>
    ## 1 johnson              4
    ## 2 perry                5
    ## 3 smith                5

## Q2

**Question:** If we grouped by gender, and then summarized with the
minimum reading score, how many rows would the resulting data frame
have?

**Answer:** There would be one for each group. Because there are two
genders in the data frame, there would be two rows. See:

``` r
scores %>% 
  group_by(gender) %>% 
  summarize(min(reading_score)) # side note: notice what happens when we don't provide a variable name
```

    ## # A tibble: 2 x 2
    ##   gender `min(reading_score)`
    ##   <chr>                 <dbl>
    ## 1 female                    4
    ## 2 male                      1

## Q3

**Question:** Remember that mutate always keeps the same number of rows
but summarize usually reduces the number of rows. Why doesn’t the
following use of summarize reduce the number of rows?

``` r
scores %>% 
  group_by(name) %>% 
  summarize(math_score_mean = mean(math_score))
```

    ## # A tibble: 9 x 2
    ##   name   math_score_mean
    ##   <chr>            <dbl>
    ## 1 alice                5
    ## 2 bobby                5
    ## 3 carol                3
    ## 4 cindy                4
    ## 5 greg                 2
    ## 6 jan                  4
    ## 7 marcia               4
    ## 8 mike                 4
    ## 9 peter                3

**Answer:** Summarize with groups makes one row for each group. In this
case, we’re grouping by name and everyone has a differente name\!

## Q4

**Question:** Create a data frame with the mean and median reading score
by gender, as well as the number of students of that gender.

``` r
scores %>% 
  group_by(gender) %>% 
  summarize(mean_reading_score = mean(reading_score),
            median_reading_score = median(reading_score),
            count = n())
```

    ## # A tibble: 2 x 4
    ##   gender mean_reading_score median_reading_score count
    ##   <chr>               <dbl>                <dbl> <int>
    ## 1 female               4.4                   4       5
    ## 2 male                 2.25                  1.5     4

# Combining verbs

## Example

**Question:** Select just the name and math\_score columns. Then create
a new column “math\_score\_ec” that is a students math score plus 5
extra credit points. Finally, arrange the data frame by math\_score\_ec
from low to high.

``` r
scores %>% 
  select(name, math_score) %>% 
  mutate(math_score_ec = math_score + 5) %>% 
  arrange(math_score_ec)
```

    ## # A tibble: 9 x 3
    ##   name   math_score math_score_ec
    ##   <chr>       <dbl>         <dbl>
    ## 1 greg            2             7
    ## 2 carol           3             8
    ## 3 peter           3             8
    ## 4 mike            4             9
    ## 5 marcia          4             9
    ## 6 jan             4             9
    ## 7 cindy           4             9
    ## 8 bobby           5            10
    ## 9 alice           5            10

## Q1

**Question:** Select every column except the teacher column. Create a
new variabled called “mean\_score” that is the mean of a student’s math
and reading score. Finally, arrange the data frame by mean\_score from
low to high.

``` r
scores %>% 
  select(-teacher) %>% 
  mutate(mean_score = (math_score + reading_score) / 2) %>% 
  arrange(desc(mean_score))
```

    ## # A tibble: 9 x 6
    ##   name   school gender math_score reading_score mean_score
    ##   <chr>  <chr>  <chr>       <dbl>         <dbl>      <dbl>
    ## 1 cindy  south  female          4             5        4.5
    ## 2 alice  south  female          5             4        4.5
    ## 3 carol  south  female          3             5        4  
    ## 4 marcia south  female          4             4        4  
    ## 5 peter  north  male            3             5        4  
    ## 6 jan    north  female          4             4        4  
    ## 7 bobby  north  male            5             1        3  
    ## 8 mike   south  male            4             1        2.5
    ## 9 greg   south  male            2             2        2

## Q2

**Question:** Remove any students with smith as a teacher, then find the
mean math\_score by gender.

``` r
scores %>% 
  filter(teacher != "smith") %>% 
  group_by(gender) %>% 
  summarize(mean_math_score = mean(math_score))
```

    ## # A tibble: 2 x 2
    ##   gender mean_math_score
    ##   <chr>            <dbl>
    ## 1 female               4
    ## 2 male                 3

## Q3

**Question:** Find the min, max, and median reading\_score for female
students at south school.

``` r
scores %>% 
  filter(gender == "female", school == "south") %>% 
  summarize(min_reading_score = min(reading_score),
            max_reading_score = max(reading_score),
            median_reading_score = median(reading_score))
```

    ## # A tibble: 1 x 3
    ##   min_reading_score max_reading_score median_reading_score
    ##               <dbl>             <dbl>                <dbl>
    ## 1                 4                 5                  4.5

## Q4

**Question:** Inspect each of the following code blocks. They both do
about the same thing. Which one do you think is preffered from a
computer efficiency standpoint?

``` r
# code block 1
scores %>% 
  group_by(school, teacher) %>% 
  summarize(max_math_score = max(math_score)) %>% 
  filter(school == "south")
```

    ## # A tibble: 2 x 3
    ## # Groups:   school [1]
    ##   school teacher max_math_score
    ##   <chr>  <chr>            <dbl>
    ## 1 south  johnson              4
    ## 2 south  perry                5

``` r
# code block 2
scores %>% 
  filter(school == "south") %>% 
  group_by(teacher) %>% 
  summarize(max_math_score = max(math_score))
```

    ## # A tibble: 2 x 2
    ##   teacher max_math_score
    ##   <chr>            <dbl>
    ## 1 johnson              4
    ## 2 perry                5

**Answer:** They both get the max math score by teacher for teachers at
south school. The first block calculates the max\_math\_score for both
north and south and then filters out north after that calculation. The
second block filters out north right away. This is preferred because it
prevents the computer from making unnecessary calculations.

## Challenge

Play around with these tools. Write a question or two that you think
best exposes a misunderstanding you had or drills down on an important
thing to remember. I’d love to add these questions in the future\! Feel
free to email what you came up with to <stenhaug@stanford.edu>.
