---
title: "R for EPP"
author: "Angelos Krypotos"
knit: slidify::knit2slides
mode: standalone
job: null
subtitle: Objects, Indexing, Directories
framework: io2012
highlighter : highlight.js
hitheme     : tomorrow 
---
<style>
  .title-slide {
    background-color:  #0000FF; /*; ; #CA9F9D*/
      /* background-image:url(http://goo.gl/EpXln); */
  }
</style>


<style>
.title-slide hgroup > h1, 
.title-slide hgroup > h2 {
  color: #FFFFFF ;  /* ; #EF5150*/
}
</style>


---
## A few words about the course

>- Goals

>- Structure

>- Feedback



--- 
## Goals of today's presentation

- Short recap of Lecture 1

- Show you how you can find help within R

- Explain the different R data types

- Become fluent in indexing

- Discover what a working directory is (well, not that exciting)

- Explain how you can download and load a package

- Explain your first homework

---
## Last time

>- We had a first taste of what R can do

>- We checked the R studio GUI

>- We explained what errors and warnings are

>- We got our feet wet with R objects


---- .smallcode
## Help!


```r
?mean
??mean
help.search("mean")
```


```r
apropos("colMeans")
```

```
## [1] ".__T__colMeans:base" ".colMeans"           "colMeans"           
## [4] "colMeans"
```


```r
?MEAN
```

```
## No documentation for 'MEAN' in specified packages and libraries:
## you could try '??MEAN'
```

--- 
## Data types
### A first look


```r
x <- c(1, 3, 5)
y <- 5
months <- c("January", "February")
```

To create an object, that will remain in your workplace, you should:

- 1. Give a (meaninful) name (e.g., x, y, months)
- 2. Use an assignment operator (e.g., <-, =)
- 3. Define your object (e.g., 5, c("January", "February"))

--- .smallcode
## Basic operators

Arithmetic operators (examples)

```r
y + 2
8 * 4
```

Boolean operators (examples)

```r
x > 5
y < 5
x == 4
x != 4
x %in% c(4, 5)
!x %in% c(4, 5)
```

----
## Basic R data structures

- vector
- matrix
- list
- data.frame
- array (Not covered)

----
## Vectors


```r
x <- c(53, 132, 4)
y <- c("apple", "orange")
```

- Keeping together numbers, strings or booleans

- If more than 1 entity, the different entities should be included in
the function c()

- In case of a sequence of numbers (e.g., 1:10), c can be ommitted.

- Also


```r
seq(from = 1, to = 10, by = 0.5)
```

```
##  [1]  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5
## [15]  8.0  8.5  9.0  9.5 10.0
```



----
## The paste function


```r
paste(c("Part"), 1:5, sep = "_")
```

```
## [1] "Part_1" "Part_2" "Part_3" "Part_4" "Part_5"
```

- Can you think where this function can be useful for you?

--- &twocol
## Useful functions

*** =left

```r
x <- c(2, 5, 6)
order(x)
```

```
## [1] 1 2 3
```

```r
sort(x)
```

```
## [1] 2 5 6
```

```r
length(x)
```

```
## [1] 3
```

*** =right

```r
rep(1, 10)
```

```
##  [1] 1 1 1 1 1 1 1 1 1 1
```

```r
sample(x = 1:10, 2, replace = TRUE)
```

```
## [1] 6 2
```

```r
table(x)
```

```
## x
## 2 5 6 
## 1 1 1
```

--- &twocol
## Vectors (Indexing)

*** =left
Simple cases

```r
stai <- c(40, 30, 41, 23, 42, 50)
stai[1]
```

```
## [1] 40
```

```r
stai[2]
```

```
## [1] 30
```

*** =right
In love with Booleans

```r
stai[stai < 30 & stai > 20]
```

```
## [1] 23
```

```r
stai[stai %in% c(41, 23)]
```

```
## [1] 41 23
```

```r
stai[!stai %in% c(41, 23)]
```

```
## [1] 40 30 42 50
```

----
## Vectors Indexing 
### The 'which' function


```r
which(stai == 23)
```

```
## [1] 4
```

----
## Matrix


```r
x <- matrix(c(134, 414, 211, 5523), nrow = 2, ncol = 2, byrow = FALSE)
x
```

```
##      [,1] [,2]
## [1,]  134  211
## [2,]  414 5523
```

- Crude description: 2 dimensional vectors
- You need to define a matrix by using the function matrix()

>- Why don't you check what happens whan byrow is set to TRUE?

----

##  Matrix
### Dimension names
- You can set the row/column names either by using the 'dimnames' argument within the 'matrix'
function or by using the 'colnames', 'rownames' functions.


```r
x <- matrix(c(134, 134, 211, 5523), nrow = 2, ncol = 2)
rownames(x) <- c("ID1", "ID2")
colnames(x) <- c("Question1", "Question2")
x
```

```
##     Question1 Question2
## ID1       134       211
## ID2       134      5523
```

----

##  Matrix
### Useful functions



```r
colMeans(x)
rowMeans(x)
colSums(x)
rowSums(x)
```


```r
table(x)
```

```
## x
##  134  211 5523 
##    2    1    1
```


---
## Matrix (indexing)

- You refer to specific rows, and columns.



```r
x
```

```
##     Question1 Question2
## ID1       134       211
## ID2       134      5523
```

```r
x[1, 2]
```

```
## [1] 211
```


---
## Matrix (indexing)

If, you want to refer to all rows of a specific column you write


```r
x[, 2]
```

```
##  ID1  ID2 
##  211 5523
```

- How would you refer to all columns of a specific row (e.g., the 1st row)?

>- x[1, ]

--- .smallcode
## Matrix (indexing)



```r
x <- matrix(c(134, 414, 211, 5523, 12, 4, 12, 55, 11, 22), nrow = 5, ncol = 2)
x
```

```
##      [,1] [,2]
## [1,]  134    4
## [2,]  414   12
## [3,]  211   55
## [4,] 5523   11
## [5,]   12   22
```

*Questions*
- How would you select rows 3, and 5 for column 2?
- How would you select rows 1, and 2 for all columns?
- How would you select the values of column 1 that are above 200?

----


```r
x[c(3, 5), 2]
```

```
## [1] 55 22
```

```r
x[1:2, ]
```

```
##      [,1] [,2]
## [1,]  134    4
## [2,]  414   12
```

```r
x[x[, 1] > 200, 1] # Yes, it is ugly
```

```
## [1]  414  211 5523
```

----
### Useful functions


```r
head(x)
```

```
##      [,1] [,2]
## [1,]  134    4
## [2,]  414   12
## [3,]  211   55
## [4,] 5523   11
## [5,]   12   22
```

```r
tail(x)
```

```
##      [,1] [,2]
## [1,]  134    4
## [2,]  414   12
## [3,]  211   55
## [4,] 5523   11
## [5,]   12   22
```

---- .smallcode
### Matrix (expansion)


```r
cbind(x, c(1, 4, 3, 5, 1))
```

Or


```r
cbind(x, "Question 3" = c(1, 4, 3, 5, 1))
```

---- .smallcode

Can you explain the following?


```r
cbind(x, c(1, 4, 3, 5, 1))
```


```r
x
```

```
##      [,1] [,2]
## [1,]  134    4
## [2,]  414   12
## [3,]  211   55
## [4,] 5523   11
## [5,]   12   22
```

Since you can combine columns with 'cbind', how could you combine rows?
>- rbind

----
## Factors
- For encoding a vector to a factor, use function factor() or as.factor()


```r
group <- c(1, 3, 1, 2)
factor(group)
```

```
## [1] 1 3 1 2
## Levels: 1 2 3
```

```r
as.factor(group)
```

```
## [1] 1 3 1 2
## Levels: 1 2 3
```

---- .smallcode
## Matrix (Some drawbacks)

- Combine data of a single type
- Indexing not as easy, or intuitive, as in data frames (see below)
- A series of useful functions, work better with data frames (see dplyr, ggplot2, packages etc.)


```r
matrix(c(1, 2, "Man", "Woman"), 2, 2)
```

```
##      [,1] [,2]   
## [1,] "1"  "Man"  
## [2,] "2"  "Woman"
```


---
## Lists

- OK, so vectors have 1 dimensions, matrices 2 dimensions.
- How many dimensions does a list have?

>- Yes, 3 :)

>- The good part of the list is that it can comnbine data of different types, 
and of different dimensions!

---.smallcode
## Lists (example)


```r
my.list <- list(my.Nums = 1:10, my.Char = c("I like it", "not"),
               my.Matrix = matrix(100:105, 3, 2), "Bugg")
my.list
```

```
## $my.Nums
##  [1]  1  2  3  4  5  6  7  8  9 10
## 
## $my.Char
## [1] "I like it" "not"      
## 
## $my.Matrix
##      [,1] [,2]
## [1,]  100  103
## [2,]  101  104
## [3,]  102  105
## 
## [[4]]
## [1] "Bugg"
```

---
## Lists (indexing)

```r
my.list[["myNums"]]
```

```
## NULL
```

```r
my.list[[1]]
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
my.list$my.Nums
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

---
## Lists (indexing)

- What happened here?



```r
my.list$Bugg
```

```
## NULL
```

---
## Lists (indexing)

- What happened here?


```r
my.list$Bugg
```

```
## NULL
```



```r
my.list[[4]]
```

```
## [1] "Bugg"
```


---
## Data frames

- The most useful, and relevant, data type.
- Although it looks like a matrix, it can hold multiple
data types
- Popular packages (e.g., plyr, ggplot2) play well with data.frames
- Sometimes it is just easier to convert a matrix to a data frame 
and move from there on (see below)


--- 

```r
my.DF <- data.frame(ID = 1:10, condition = c(1, 2, 1, 2, 2, 1, 1, 2, 1, 1), 
Sex = c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F"))
head(myDF)
```

```
## Error in head(myDF): error in evaluating the argument 'x' in selecting a method for function 'head': Error: object 'myDF' not found
```

```r
myDF$liz = list("1", "2")
```

```
## Error in myDF$liz = list("1", "2"): object 'myDF' not found
```

```r
tail(myDF, n = 3)
```

```
## Error in tail(myDF, n = 3): error in evaluating the argument 'x' in selecting a method for function 'tail': Error: object 'myDF' not found
```

---
## Data frames (indexing)
Largely similar to previously types


```r
myDF$ID
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
myDF[[2]]
```

```
##  [1] 1 2 1 2 2 1 1 2 1 1
```

```r
myDF[["Sex"]]
```

```
##  [1] M F M F M F M F M F
## Levels: F M
```

---
## Convert 

- It is extremely useful to be able to move between different
types

- For that, you can use the as.[type] functions

as.numeric()

as.matrix()

as.list()

as.data.frame()

YOU SHOULD ALWAYS CHECK THE RESULT!!


---
## Working directory

- The folder that R operates
- If you want to refer to data outside that directory,
you need to give the relative, or full path of the file.

Key functions

- getwd()
- setwd()

---
## Working directory


```r
getwd()
```

```
## [1] "C:/Users/Krypo001/Dropbox/PostDocUU/eepR/lecture2"
```

```r
setwd("C:/Users/Krypo001/Dropbox")
getwd()
```

```
## [1] "C:/Users/Krypo001/Dropbox"
```

---
## Working directory
### Things to look after

- Seperate the differt folders in the path with either "/" or "\\\\".
Do not use "\".

- It is also fine to set a path relative to your working directory. 


```r
setwd("C:/Users/Krypo001/Dropbox/PostDocUU/eepR/lecture2")
getwd()
```

```
## [1] "C:/Users/Krypo001/Dropbox/PostDocUU/eepR/lecture2"
```

```r
setwd("./assets")
getwd()
```

```
## [1] "C:/Users/Krypo001/Dropbox/PostDocUU/eepR/lecture2/assets"
```

---
## Packages

- Collection of functions with their help files

```r
# Install package
install.packages("myAwesomePackageR")
# Load package
library("myAwesomePackageR")
```

Alternatively, use the 'packages' tab (bottom right side) in R studio.

---
## Working directory 
### Why should you care?

- You can just store your data there and point
to your directory

- Better not sure setwd() when using .Rnw files [Yihui Xie on that](https://groups.google.com/forum/?fromgroups=#!topic/knitr/knM0VWoexT0)
- Main reason: reproducibility problems


---
## Instructions on Assignment

- All assignments can be found [here](https://github.com/AngelosPsy/EPPR/tree/master/Assignments)
- You can hand in your assignments by sending me an html document, with, when
asked, runnable code.
- Note: make sure that you remove the "eval = T", wherever you see it.
- Note: For writing text you should start each line with "#'" (without the quotation)


---

## The end
