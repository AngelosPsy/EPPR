---
title: "R for EPP"
author: "Angelos Krypotos"
knit: slidify::knit2slides
mode: standalone
job: null
subtitle: Load data, if else statements, loops
framework: io2012
widgets     : [mathjax angularjs]  
highlighter : highlight.js
hitheme     : tomorrow 
---
<style>
  .title-slide {
    background-color:  #E0E0E0; /*; ; #CA9F9D*/
      /* background-image:url(http://goo.gl/EpXln); */
  }
</style>


<style>
.title-slide hgroup > h1, 
.title-slide hgroup > h2 {
  color: #660066 ;  /* ; #EF5150*/
}
</style>



--- 
## Goals of today's presentation

- Assignment 1 (Feedback)

- Load txt, xls, and sav files into R

- If else statments

- Loops (Part 1; only if we have time)

---
## Assignment 1

> - General rule: Trying is better than not doing it at all

> - Building a feel about programming requires trial and error

> - You can always ask me for the answers to the questions


---
## Assignment 1

- How was it?

- How much time did you spend?

- Were the questions clear enough?

- Format changes?

--- 
## Loading data


- R can see the data in your directory
- You can, however, give the full path of
a file 
- **Best practice** -> Define data relative to your 
[R project](https://support.rstudio.com/hc/en-us/articles/200526207-Using-Projects)
- You can load data from Rstudio with the `Import Dataset' button



```r
getwd()
setwd()
```


--- 
## Writing and loading txt files

**Write txt files**

```r
write.table(x = 1:10, "example.txt", row.names = FALSE, quote = F)
```

**Load data -- 1st way** 

```r
read.table ("example.txt", header = TRUE)
```

**Load data -- 2nd way** 

```r
library(readr)
read_file("example.txt", delim = "")
```


---
### Loading (.sav) SPSS files

**Write sav files -- Better not do though**


```r
write.foreign(x, "example.sav", codefile = "example.sps", package = "SPSS")
```


- Most common way: read.spss in foreign -- But you may get [warnings](http://stackoverflow.com/questions/7691739/warning-error-when-importing-a-sav)!


```r
library(foreign)
read.spss("example.sav",  use.value.labels = FALSE, to.data.frame = TRUE)
```

- Alternatively

```r
load('memisc')
spss.data <- as.data.set(spss.system.file("example.sav"))
```

---
### Writing and loading csv files

**Write**


```r
write.csv(x, "example.csv")
```

**Read**


```r
read.csv("example.csv")
```

Other functions: read.csv2, read.delim (in readr), read.delim2 (in readr)

---
### Last thoughts

> - Of course there are other types of data you can load (e.g., stata data,
HTML tables etc.)
> - Whenever you load any data, CHECK CHECK CHECK that the data were
loaded correctly
> - Working directory mistakes are common, so do not freak out

----

### If else statments

- Conditional statements are common in many programming languages
- A good command of those statements will improve your programming skills
- Instances were conditiongal statments are useful:
   1. Check which participants meet specific criterian (that reminds you of?)
   2. Transform data of participants that satify a specific condition

---
### So, let's get started!
   
---
### How does it work in R?


```r
if (condition) {
   expression
}
```


```r
hungry = TRUE
if (hungry) {
   print("Get something to eat dude!")
}
```

```
## [1] "Get something to eat dude!"
```

---
### How does it work in R?


```r
if (condition) {
   expression
} else {
  alternative expression
}
```


```r
hungry = FALSE
if (hungry) {
   print("Get something to eat dude!")
} else{
  print("Time to party!")
}
```

```
## [1] "Time to party!"
```

---
### How does it work in R?


```r
if (condition) {
   expression
} else if (condition2) {
   alternative expression
} else
   alternative expression2
}
```


```r
hungry = FALSE
friends = FALSE
if (hungry) {
   print("Get something to eat dude!")
} else if (friends){
  print("Time to party!")
} else {
  print("Netflix and chill!")
}
```

---
### Some last thoughts

- ?ifelse()
- TEST TEST TEST the if else statments
- Curly brackets makes the code easier to read
- Of course booleans can take complicated forms (e.g., if THis & THAT is TRUE)

--- 
### Loop statements

- 'A sequence of instruction s that is continually repeated until a certain condition is reached' [reference](http://whatis.techtarget.com/definition/loop)
- Avoid whenever possible (but that is not always possible)
- Whenever use, chose *implicit* over *explicit* looping

--- &twocol
### Explicit vs. Implicit looping

***=left
**Explicit loops**

```r
my.matrix <- matrix(1:10, nrow = 2, ncol = 5)
x <- numeric()
for (i in 1:ncol(my.matrix)){
  x[i] <- median(my.matrix[, i])
}
```
+ Easy to learn and understand
+ Easy to read
- Slow
- Ugly

***=right
**Implicit loops**

```r
my.matrix <- matrix(1:10, nrow = 2, ncol = 5)
x <- apply(my.matrix, 2, median)
```
+ Faster programs
+ Shorter programs
+ Points on geekiness
- Harder to learn
- Harder to understand

[Wisdom from Yihui](http://yihui.name/en/2010/10/on-the-gory-loops-in-r/)

----
### Explicit looping

- For loops
- While loops
- Repeat loops

---
### For loops

**Idea**


```r
for (value in sequence){
    DoSomething
}
```

**Example**


```r
for (i in 1:10){
  print(i)
}
```


---
### For loops

**Example 2**


```r
my.matrix <- matrix(1:10, 
                    nrow = 2, ncol = 5)
x <- numeric()
for (i in 1:ncol(my.matrix)){
  x[i] <- median(my.matrix[, i])
}
```

---
### While loops

**Idea**


```r
while (somethingHolds){
    DoSomething
}
```

**Example**


```r
i = 1
while (i <= 10){
  print(i)
  i = i + 1
}
```

---
### While loops 

**Example 2**


```r
my.matrix <- matrix(1:10, 
                    nrow = 2, ncol = 5)
x <- numeric()
i <- 1
while (i < ncol (my.matrix)){
  x[i] <- median(my.matrix[, i])
  i = i + 1
}
```

---
### Repeat loops

**Idea**


```r
repeat{
    DoSomething
}
```

**Example**


```r
i <- 1
repeat{
    print (i)
    if(i >= 10){
      break
    }
  i = i + 1
}
```

---
### Repeat loops

**Example 2**


```r
my.matrix <- matrix(1:10, 
                    nrow = 2, ncol = 5)
x <- numeric()
i <- 1
repeat{
  x[i] <- median(my.matrix[, i])
  if (i > ncol(my.matrix){
    break
  }
  i = i + 1
}
```

---
## Instructions on Assignment

- All assignments can be found [here](https://github.com/AngelosPsy/EPPR/tree/master/Assignments)
- You can hand in your assignments by sending me an html document, with, when
asked, runnable code.
- Go as far as possible with the assignment. If you cannot complete it, no problem.
- I AM AVAILABLE FOR QUESTIONS!!!!!!
- Note: make sure that you remove the "eval = T", wherever you see it.
- Note: For writing text you should start each line with "#'" (without the quotation marks)

---

## The end
