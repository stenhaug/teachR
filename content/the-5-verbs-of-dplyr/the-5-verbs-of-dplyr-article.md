Article - The 5 verbs of dplyr
================
Ben

# Getting started

As always, the first thing we will do is load the tidyverse.

*Note: If you haven’t yet installed the tidyverse, you’ll first have to
run the code install.packages(“tidyverse”).*

``` r
library(tidyverse)
```

The Tidyverse is a collection of packages made by Hadley Wickham. One of
the key packages in that collection is called dplyr. Think of the d as
standing for data and the plyr standing for plyers – the goal of this
package is to manipulate data frames in useful ways.

The magic of dplyr is that with just a handful of commands (the verbs of
dplyr), you can do nearly anything you’d want to do with your data.

This article will cover the five verbs of dplyr: select, filter,
arrange, mutate, and summarize.

Before we walk through each command, let’s make a data frame to play
with.

``` r
hamsters <- data_frame(name = c("Megan", "Amy", "Jen", "Karl", "Jeremy"),
                 gender = c("female", "female", "female", "male", "male"),
                 hamsters = c(5, 7, 6, 2, 1),
                 hamster_cages = c(2, 1, 3, 3, 4))
```

Don’t worry too much about the above code, but you might stop and
inspect it. Notice that we’re creating a data frame named hamsters. The
first column is name and then we list the names. The c stands for
concatenate and its how we stick multiple things together. All strings
(aka words) need to have quotes around them. The second column is gender
and so on.

By just running the name of the data frame, hamsters, it will show it to
us and tell us a little bit about it. The 5 x 4 says it has 5 rows and 4
columns. Each column has a type: name and gender are <chr> which stands
for characters, and the other columns are <dbl> which stands for double
and is another word for number.

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

Now that we have a data frame to work with, we can dive into the 5 verbs
of dplyr. The code blocks below will show small little examples of what
is possible. Before doing something with hamsters, I’ll typically print
the original hamsters data frame first because the easiest way to see
what a function is doing is to see a before and after.

# Arrange

Arrange keeps all of the information in the data frame, but just changes
the order of the rows. This is the same thing that the “sort” feature in
Excel does.

By default, arranging happens in ascending order or from low to high:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  arrange(hamsters)
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Jeremy male          1             4
    ## 2 Karl   male          2             3
    ## 3 Megan  female        5             2
    ## 4 Jen    female        6             3
    ## 5 Amy    female        7             1

We can instead arrange in descending order with the desc() function:

``` r
hamsters %>% 
  arrange(desc(hamster_cages))
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Jeremy male          1             4
    ## 2 Jen    female        6             3
    ## 3 Karl   male          2             3
    ## 4 Megan  female        5             2
    ## 5 Amy    female        7             1

Character columns get arranged in alaphetical order:

``` r
hamsters %>% 
  arrange(name)
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Amy    female        7             1
    ## 2 Jen    female        6             3
    ## 3 Jeremy male          1             4
    ## 4 Karl   male          2             3
    ## 5 Megan  female        5             2

If we input multiple column names, arrange uses the additional columns
to break ties.

**Self-explanation: Why do Karl and Jen switch positions in the
following two data frames?**

``` r
hamsters %>% 
  arrange(hamster_cages)
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Amy    female        7             1
    ## 2 Megan  female        5             2
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  arrange(hamster_cages, hamsters)
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Amy    female        7             1
    ## 2 Megan  female        5             2
    ## 3 Karl   male          2             3
    ## 4 Jen    female        6             3
    ## 5 Jeremy male          1             4

# Select

Select is used to choose which columns to work with. For example, maybe
we want just the name and hamsters columns:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  select(name, hamsters)
```

    ## # A tibble: 5 x 2
    ##   name   hamsters
    ##   <chr>     <dbl>
    ## 1 Megan         5
    ## 2 Amy           7
    ## 3 Jen           6
    ## 4 Karl          2
    ## 5 Jeremy        1

We can use a “-” to get rid of a column and leave the rest of the
columns:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  select(-name)
```

    ## # A tibble: 5 x 3
    ##   gender hamsters hamster_cages
    ##   <chr>     <dbl>         <dbl>
    ## 1 female        5             2
    ## 2 female        7             1
    ## 3 female        6             3
    ## 4 male          2             3
    ## 5 male          1             4

We also could have gotten just the name and hamsters columns by removing
the gender and hamster\_cages columns:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  select(-gender, -hamster_cages)
```

    ## # A tibble: 5 x 2
    ##   name   hamsters
    ##   <chr>     <dbl>
    ## 1 Megan         5
    ## 2 Amy           7
    ## 3 Jen           6
    ## 4 Karl          2
    ## 5 Jeremy        1

Select can also be used to rearrange the order of columns:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  select(hamsters, hamster_cages, gender, name)
```

    ## # A tibble: 5 x 4
    ##   hamsters hamster_cages gender name  
    ##      <dbl>         <dbl> <chr>  <chr> 
    ## 1        5             2 female Megan 
    ## 2        7             1 female Amy   
    ## 3        6             3 female Jen   
    ## 4        2             3 male   Karl  
    ## 5        1             4 male   Jeremy

everything() is a convenient shortcut that adds all the columns that
haven’t been used yet. It is very useful if you want to move a column to
the front of a data frame:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  select(hamster_cages, everything())
```

    ## # A tibble: 5 x 4
    ##   hamster_cages name   gender hamsters
    ##           <dbl> <chr>  <chr>     <dbl>
    ## 1             2 Megan  female        5
    ## 2             1 Amy    female        7
    ## 3             3 Jen    female        6
    ## 4             3 Karl   male          2
    ## 5             4 Jeremy male          1

# Filter

Filter is used to select which rows you want. For example, maybe we only
want students with more than 3 hamsters:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  filter(hamsters > 3)
```

    ## # A tibble: 3 x 4
    ##   name  gender hamsters hamster_cages
    ##   <chr> <chr>     <dbl>         <dbl>
    ## 1 Megan female        5             2
    ## 2 Amy   female        7             1
    ## 3 Jen   female        6             3

*(Notice that there is a variable named the same thing as the data
frame. The first “hamsters” in the following code refers to the data
frame, while the second “hamsters” refers to the hamsters column.)*

Or maybe we only want female students:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  filter(gender == "female")
```

    ## # A tibble: 3 x 4
    ##   name  gender hamsters hamster_cages
    ##   <chr> <chr>     <dbl>         <dbl>
    ## 1 Megan female        5             2
    ## 2 Amy   female        7             1
    ## 3 Jen   female        6             3

Notice that we had to use “==” instead of “=”. This is because “=” is
for assignemnt – making something equal something else – whereas “==” is
for comparison – seeing if two things are equal or not.

If we want to use an “and” (require that multiple conditions hold) we
can either use the “&” sign or separate the conditions with a comma. For
example, the following two filters are equivalent:

``` r
hamsters %>% 
  filter(gender == "female" & hamsters >= 6)
```

    ## # A tibble: 2 x 4
    ##   name  gender hamsters hamster_cages
    ##   <chr> <chr>     <dbl>         <dbl>
    ## 1 Amy   female        7             1
    ## 2 Jen   female        6             3

``` r
hamsters %>% 
  filter(gender == "female", hamsters >= 6)
```

    ## # A tibble: 2 x 4
    ##   name  gender hamsters hamster_cages
    ##   <chr> <chr>     <dbl>         <dbl>
    ## 1 Amy   female        7             1
    ## 2 Jen   female        6             3

If we want to use an “or” (require that just 1 of multiple conditions
holds) we have to use the | sign (hold “shift” and the key above the
“return” key). For example:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  filter(gender == "male" | hamsters >= 7)
```

    ## # A tibble: 3 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Amy    female        7             1
    ## 2 Karl   male          2             3
    ## 3 Jeremy male          1             4

A case that commonly comes up is requiring that a variable has one of a
set of specific values. For example, maybe we only want students with 2,
4, 6, or 8 hamsters.

The most intuitive way to do this is with a series of “or” statements:

``` r
hamsters %>% 
  filter(hamsters == 2 | hamsters == 4 | hamsters == 6 | hamsters == 8)
```

    ## # A tibble: 2 x 4
    ##   name  gender hamsters hamster_cages
    ##   <chr> <chr>     <dbl>         <dbl>
    ## 1 Jen   female        6             3
    ## 2 Karl  male          2             3

It gets tedious having to type and retype the word “hamsters” over and
over again, though.

A nice shortcut is to supply the values you’re interested in as a vector
by typing c(2, 4, 6, 8) – the c stands for concatenate which basically
means to glue 2 to 4 to 6 to 8 all together in one vector.

Once we have that vector we can simply check if the number of hamsters
for that row is “%in%” the vector we created. Here’s how that looks:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  filter(hamsters %in% c(2, 4, 6, 8))
```

    ## # A tibble: 2 x 4
    ##   name  gender hamsters hamster_cages
    ##   <chr> <chr>     <dbl>         <dbl>
    ## 1 Jen   female        6             3
    ## 2 Karl  male          2             3

This can be a little bit confusing, so make sure you understand this.
Think about the filter as happening row by row: first it checks the
first row to see if 5 is in c(2, 4, 6, 8) – it isn’t so it doesn’t
include that row. Then it checks the second row and also doesn’t include
that one because 7 isn’t in the vector. It then checks the third row and
keeps it because 6 is in there, and so on.

# Filter with groups

Groups can be confusing at first but they are incredibly useful. Usually
code operates on rows. For example, the code above checked each row to
see if the gender was female in that row.

But sometimes we want to work with groups of rows instead of one row at
a time. To do so, we add a group attribute to the data frame before we
do anything.

Here’s example code and a visual depiction of grouping a data frame by
the “a” column:

``` r
dataframe %>% 
   group_by(a)
```

![](/images/group_by.png)

*Sourced from [R Bootcamp at
Berkeley](https://github.com/berkeley-scf/r-bootcamp-2017)*

This sort of thinking is often called split-apply-combine: The idea is
to split a data frame into multiple groups, apply something to each
group, then combine the groups back into a single data frame.

Let’s look at an example with hamsters:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  group_by(gender) %>% 
  filter(max(hamster_cages) == 3)
```

    ## # A tibble: 3 x 4
    ## # Groups:   gender [1]
    ##   name  gender hamsters hamster_cages
    ##   <chr> <chr>     <dbl>         <dbl>
    ## 1 Megan female        5             2
    ## 2 Amy   female        7             1
    ## 3 Jen   female        6             3

We first grouped by gender. After that, every operation will happen at
the group level instead of the row level.

The final line is where the magic happens. It tells R to return only the
gender group where the max number of hamster cages is 3. This is the
female group.

Notice that the male group isn’t included because the max number of
hamster cages is 4, not 3.

Similarly, we can get the gender group where the mean number of hamsters
is 1.5. This time its the male group because there are two males – one
with 1 hamster and the other with 2 hamsters.

``` r
hamsters 
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  group_by(gender) %>% 
  filter(mean(hamsters) == 1.5)
```

    ## # A tibble: 2 x 4
    ## # Groups:   gender [1]
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Karl   male          2             3
    ## 2 Jeremy male          1             4

The n() function is a shortcut for the number of rows in the group. So,
the following code finds the gender group with 3 rows in it:

``` r
hamsters 
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  group_by(gender) %>% 
  filter(n() == 4)
```

    ## # A tibble: 0 x 4
    ## # Groups:   gender [0]
    ## # ... with 4 variables: name <chr>, gender <chr>, hamsters <dbl>,
    ## #   hamster_cages <dbl>

Of course, there isn’t any reason that we have to group by gender. We
could instead group by the number of hamster cages.

**Self-explanation: Why don’t Jen or Karl appear in the data frame after
we filter?**

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  group_by(hamster_cages) %>% 
  filter(n() == 1)
```

    ## # A tibble: 3 x 4
    ## # Groups:   hamster_cages [3]
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jeremy male          1             4

# Mutate

So far, arrange has sorted our data, select has chosen which columns to
work with, and filter has sorted which rows to use. We haven’t changed
our data at all yet though – that’s what mutate does\!

For example, maybe we want to create a new variable based on the number
of hamsters per cage for each person:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  mutate(hamsters_per_cage = hamsters / hamster_cages)
```

    ## # A tibble: 5 x 5
    ##   name   gender hamsters hamster_cages hamsters_per_cage
    ##   <chr>  <chr>     <dbl>         <dbl>             <dbl>
    ## 1 Megan  female        5             2             2.5  
    ## 2 Amy    female        7             1             7    
    ## 3 Jen    female        6             3             2    
    ## 4 Karl   male          2             3             0.667
    ## 5 Jeremy male          1             4             0.25

Note that this is the first time we can start to combine the dplyr verbs
to really make some magic happen\!

``` r
hamsters %>% 
  mutate(hamsters_per_cage = hamsters / hamster_cages) %>% 
  arrange(hamsters_per_cage)
```

    ## # A tibble: 5 x 5
    ##   name   gender hamsters hamster_cages hamsters_per_cage
    ##   <chr>  <chr>     <dbl>         <dbl>             <dbl>
    ## 1 Jeremy male          1             4             0.25 
    ## 2 Karl   male          2             3             0.667
    ## 3 Jen    female        6             3             2    
    ## 4 Megan  female        5             2             2.5  
    ## 5 Amy    female        7             1             7

Or maybe we want an indicator of if the person has 5 or more hamsters:

``` r
hamsters %>% 
  mutate(five_or_more_hamsters = hamsters >= 5)
```

    ## # A tibble: 5 x 5
    ##   name   gender hamsters hamster_cages five_or_more_hamsters
    ##   <chr>  <chr>     <dbl>         <dbl> <lgl>                
    ## 1 Megan  female        5             2 TRUE                 
    ## 2 Amy    female        7             1 TRUE                 
    ## 3 Jen    female        6             3 TRUE                 
    ## 4 Karl   male          2             3 FALSE                
    ## 5 Jeremy male          1             4 FALSE

We can also use mutate to input new data:

``` r
hamsters %>% 
  mutate(cats = c(4, 5, 2, 3, 1))
```

    ## # A tibble: 5 x 5
    ##   name   gender hamsters hamster_cages  cats
    ##   <chr>  <chr>     <dbl>         <dbl> <dbl>
    ## 1 Megan  female        5             2     4
    ## 2 Amy    female        7             1     5
    ## 3 Jen    female        6             3     2
    ## 4 Karl   male          2             3     3
    ## 5 Jeremy male          1             4     1

Of course, this only works if we give it the right amount of values:

``` r
hamsters %>% 
  mutate(dogs = c(1, 3, 5))
```

    ## Error in mutate_impl(.data, dots): Column `dogs` must be length 5 (the number of rows) or one, not 3

Interestingly, we can give it just 1 value and it will repeat it the
correct number of times automatically:

``` r
hamsters %>% 
  mutate(walruses = 0)
```

    ## # A tibble: 5 x 5
    ##   name   gender hamsters hamster_cages walruses
    ##   <chr>  <chr>     <dbl>         <dbl>    <dbl>
    ## 1 Megan  female        5             2        0
    ## 2 Amy    female        7             1        0
    ## 3 Jen    female        6             3        0
    ## 4 Karl   male          2             3        0
    ## 5 Jeremy male          1             4        0

We can create multiple new columns with one use of mutate if we separate
each new column with a “,”:

``` r
hamsters %>% 
  mutate(hamsters_per_cage = hamsters / hamster_cages,
         five_or_more_hamsters = hamsters >= 5)
```

    ## # A tibble: 5 x 6
    ##   name   gender hamsters hamster_cages hamsters_per_cage five_or_more_ham…
    ##   <chr>  <chr>     <dbl>         <dbl>             <dbl> <lgl>            
    ## 1 Megan  female        5             2             2.5   TRUE             
    ## 2 Amy    female        7             1             7     TRUE             
    ## 3 Jen    female        6             3             2     TRUE             
    ## 4 Karl   male          2             3             0.667 FALSE            
    ## 5 Jeremy male          1             4             0.25  FALSE

Notice that “mutate” leaves all of the original columns in the dataframe
and adds new columns. If we instead use “transmute” we’ll only get the
new columns:

``` r
hamsters %>% 
  transmute(hamsters_per_cage = hamsters / hamster_cages,
         five_or_more_hamsters = hamsters >= 5)
```

    ## # A tibble: 5 x 2
    ##   hamsters_per_cage five_or_more_hamsters
    ##               <dbl> <lgl>                
    ## 1             2.5   TRUE                 
    ## 2             7     TRUE                 
    ## 3             2     TRUE                 
    ## 4             0.667 FALSE                
    ## 5             0.25  FALSE

Slightly more complex things can be done by using values calculated from
the data frame in the creation of a new column.

``` r
hamsters %>% 
  mutate(hamster_cages_centered = hamster_cages - mean(hamster_cages))
```

    ## # A tibble: 5 x 5
    ##   name   gender hamsters hamster_cages hamster_cages_centered
    ##   <chr>  <chr>     <dbl>         <dbl>                  <dbl>
    ## 1 Megan  female        5             2                 -0.6  
    ## 2 Amy    female        7             1                 -1.6  
    ## 3 Jen    female        6             3                  0.400
    ## 4 Karl   male          2             3                  0.400
    ## 5 Jeremy male          1             4                  1.4

Notice that first the mean of the hamster\_cages column is calculated to
be 2.6, then the new column is created by subtracting 2.6 off of each
value of the hamster\_cages column.

# Mutate with groups

Sometimes its useful to define new variables based on a group. Remember
groups tell R to operate on the data frame one group at a time as
opposed to using all of the rows in the data frame.

For example, examine the following – note how it’s different from the
code above:

``` r
hamsters %>% 
  group_by(gender) %>% 
  mutate(hamster_cages_centered_by_gender = hamster_cages - mean(hamster_cages))
```

    ## # A tibble: 5 x 5
    ## # Groups:   gender [2]
    ##   name   gender hamsters hamster_cages hamster_cages_centered_by_gender
    ##   <chr>  <chr>     <dbl>         <dbl>                            <dbl>
    ## 1 Megan  female        5             2                              0  
    ## 2 Amy    female        7             1                             -1  
    ## 3 Jen    female        6             3                              1  
    ## 4 Karl   male          2             3                             -0.5
    ## 5 Jeremy male          1             4                              0.5

Before in “hamster\_cages\_centered” we subtracted the mean of
hamster\_cages which was 2.6 off of every value of hamster\_cages.

Now because we are grouping by gender, we subtract 2 off of
hamster\_cages for females and 3.5 off of hamster\_cages for males. This
is because mean(hamster\_cages) operates on groups of rows defined by
gender after we add the “group\_by(gender)” attribute to the data frame.

**Challenge: See if you can understand what the following code is doing.
Warning, the “new\_varible” doesn’t really make sense context.**

``` r
hamsters %>% 
  group_by(hamster_cages) %>% 
  mutate(new_variable = hamster_cages - n())
```

    ## # A tibble: 5 x 5
    ## # Groups:   hamster_cages [4]
    ##   name   gender hamsters hamster_cages new_variable
    ##   <chr>  <chr>     <dbl>         <dbl>        <dbl>
    ## 1 Megan  female        5             2            1
    ## 2 Amy    female        7             1            0
    ## 3 Jen    female        6             3            1
    ## 4 Karl   male          2             3            1
    ## 5 Jeremy male          1             4            3

# Summarize

Mutate kept the same number of rows in the data frame and added a
column.

We also want to be able to collapse rows of a data frame which we might
think of summarizing. One of the most common ways to summarize a set of
numbers is to take the mean:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  summarize(hamsters_mean = mean(hamsters))
```

    ## # A tibble: 1 x 1
    ##   hamsters_mean
    ##           <dbl>
    ## 1           4.2

Another common method of summarizing is the median. We can summarize
multiple variables with multiple functions at the same time:

``` r
hamsters %>%
  summarize(hamsters_mean = mean(hamsters),
            hamsters_median = median(hamsters),
            hamster_cages_mean = mean(hamster_cages),
            hamster_cages_median = median(hamster_cages))
```

    ## # A tibble: 1 x 4
    ##   hamsters_mean hamsters_median hamster_cages_mean hamster_cages_median
    ##           <dbl>           <dbl>              <dbl>                <dbl>
    ## 1           4.2               5                2.6                    3

# Summarize with groups

Summarize isn’t that useful by itself, but when we add groups it becomes
crazy powerful\!

It allows us to get a summary row for each group in the data frame:

``` r
hamsters
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Amy    female        7             1
    ## 3 Jen    female        6             3
    ## 4 Karl   male          2             3
    ## 5 Jeremy male          1             4

``` r
hamsters %>% 
  group_by(gender) %>% 
  summarize(mean_hamsters = mean(hamsters))
```

    ## # A tibble: 2 x 2
    ##   gender mean_hamsters
    ##   <chr>          <dbl>
    ## 1 female           6  
    ## 2 male             1.5

Just as before, we can create multiple summary statistics all at once:

``` r
hamsters %>% 
  group_by(gender) %>% 
  summarize(mean_hamsters = mean(hamsters),
            max_hamsters = max(hamsters),
            count = n())
```

    ## # A tibble: 2 x 4
    ##   gender mean_hamsters max_hamsters count
    ##   <chr>          <dbl>        <dbl> <int>
    ## 1 female           6              7     3
    ## 2 male             1.5            2     2

Of course, we don’t have to group by gender (it just happens to be the
most natural in this case):

``` r
hamsters %>% 
  group_by(hamster_cages) %>% 
  summarize(max_hamsters = max(hamsters),
            count = n())
```

    ## # A tibble: 4 x 3
    ##   hamster_cages max_hamsters count
    ##           <dbl>        <dbl> <int>
    ## 1             1            7     1
    ## 2             2            5     1
    ## 3             3            6     2
    ## 4             4            1     1

It is easy to get the difference between mutate and summarize confused.
Remember that mutate returns the same number of rows in a data frame,
summarize returns just one row, and summarize with groups returns a row
for each group.

# The power of combining verbs\!

The true power of dplyr comes from combining these 5 verbs to solve
problems. For example, see how we can piece commands together to do more
and more complex operations:

``` r
hamsters %>%
  arrange(hamsters)
```

    ## # A tibble: 5 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Jeremy male          1             4
    ## 2 Karl   male          2             3
    ## 3 Megan  female        5             2
    ## 4 Jen    female        6             3
    ## 5 Amy    female        7             1

``` r
hamsters %>%
  arrange(hamsters) %>% 
  select(-name) 
```

    ## # A tibble: 5 x 3
    ##   gender hamsters hamster_cages
    ##   <chr>     <dbl>         <dbl>
    ## 1 male          1             4
    ## 2 male          2             3
    ## 3 female        5             2
    ## 4 female        6             3
    ## 5 female        7             1

``` r
hamsters %>%
  arrange(hamsters) %>% 
  select(-name) %>% 
  mutate(walruses = 0) 
```

    ## # A tibble: 5 x 4
    ##   gender hamsters hamster_cages walruses
    ##   <chr>     <dbl>         <dbl>    <dbl>
    ## 1 male          1             4        0
    ## 2 male          2             3        0
    ## 3 female        5             2        0
    ## 4 female        6             3        0
    ## 5 female        7             1        0

``` r
hamsters %>%
  arrange(hamsters) %>% 
  select(-name) %>% 
  mutate(walruses = 0) %>% 
  group_by(gender) %>% 
  mutate(hamsters_centered_by_gender = hamsters - mean(hamsters))
```

    ## # A tibble: 5 x 5
    ## # Groups:   gender [2]
    ##   gender hamsters hamster_cages walruses hamsters_centered_by_gender
    ##   <chr>     <dbl>         <dbl>    <dbl>                       <dbl>
    ## 1 male          1             4        0                        -0.5
    ## 2 male          2             3        0                         0.5
    ## 3 female        5             2        0                        -1  
    ## 4 female        6             3        0                         0  
    ## 5 female        7             1        0                         1

``` r
hamsters %>%
  arrange(hamsters) %>% 
  select(-name) %>% 
  mutate(walruses = 0) %>% 
  group_by(gender) %>% 
  mutate(hamsters_centered_by_gender = hamsters - mean(hamsters))
```

    ## # A tibble: 5 x 5
    ## # Groups:   gender [2]
    ##   gender hamsters hamster_cages walruses hamsters_centered_by_gender
    ##   <chr>     <dbl>         <dbl>    <dbl>                       <dbl>
    ## 1 male          1             4        0                        -0.5
    ## 2 male          2             3        0                         0.5
    ## 3 female        5             2        0                        -1  
    ## 4 female        6             3        0                         0  
    ## 5 female        7             1        0                         1

# A few more examples

There are many little tricks that dplyr can do that we haven’t talked
about. Below are a few of those.

Grouping and summarizing to get counts is so common that there is a
shortcut “count” function:

``` r
hamsters %>% 
  group_by(gender) %>% 
  summarise(n = n())
```

    ## # A tibble: 2 x 2
    ##   gender     n
    ##   <chr>  <int>
    ## 1 female     3
    ## 2 male       2

``` r
hamsters %>% 
  count(gender)
```

    ## # A tibble: 2 x 2
    ##   gender     n
    ##   <chr>  <int>
    ## 1 female     3
    ## 2 male       2

If you’re working with a lot of columns, select has some really useful
helper functions. For example, we can get all of the columns that start
with the letter “h”:

``` r
hamsters %>% 
  select(starts_with("h"))
```

    ## # A tibble: 5 x 2
    ##   hamsters hamster_cages
    ##      <dbl>         <dbl>
    ## 1        5             2
    ## 2        7             1
    ## 3        6             3
    ## 4        2             3
    ## 5        1             4

Sometimes people will use mutate to create a variable and then use that
new variable to filter, but you can just put that variable definition as
the filter condition:

``` r
hamsters %>% 
  mutate(more_than_5_hamsters_OR_2_cages = hamsters > 5 | hamster_cages > 3) %>% 
  filter(more_than_5_hamsters_OR_2_cages)
```

    ## # A tibble: 3 x 5
    ##   name   gender hamsters hamster_cages more_than_5_hamsters_OR_2_cages
    ##   <chr>  <chr>     <dbl>         <dbl> <lgl>                          
    ## 1 Amy    female        7             1 TRUE                           
    ## 2 Jen    female        6             3 TRUE                           
    ## 3 Jeremy male          1             4 TRUE

``` r
hamsters %>% 
  filter(hamsters > 5 | hamster_cages > 3)
```

    ## # A tibble: 3 x 4
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Amy    female        7             1
    ## 2 Jen    female        6             3
    ## 3 Jeremy male          1             4

Maybe you want the person with the fewest number of hamsters by gender:

``` r
hamsters %>% 
  arrange(hamsters) %>% # can you figure out why we need this arrange?
  group_by(gender) %>% 
  summarise(fewest_hamsters = first(hamsters))
```

    ## # A tibble: 2 x 2
    ##   gender fewest_hamsters
    ##   <chr>            <dbl>
    ## 1 female               5
    ## 2 male                 1

If we want to keep the entire row, we can use the “slice” function to
slice out the first row:

``` r
hamsters %>% 
  arrange(hamsters) %>% # can you figure out why we need this arrange?
  group_by(gender) %>% 
  slice(1)
```

    ## # A tibble: 2 x 4
    ## # Groups:   gender [2]
    ##   name   gender hamsters hamster_cages
    ##   <chr>  <chr>     <dbl>         <dbl>
    ## 1 Megan  female        5             2
    ## 2 Jeremy male          1             4

# Future improvements and other resources

To add in the future… at/if/all, rolling off multiple groups, …

This
[cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)
is a great way of seeing all of the functions at once. Some data
scientists work with it on their desk.

[R for data science](http://r4ds.had.co.nz/transform.html),
[stats 545](http://stat545.com/block010_dplyr-end-single-table.html),
and [Simon Ejdemyr’s
website](https://stanford.edu/~ejdemyr/r-tutorials/modifying-data/) all
have thoughtful writing and exercises on more advanced features of
dplyr. \`\`\`
