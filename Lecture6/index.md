---
title: "R for EPP"
author: "Angelos Krypotos"
knit: slidify::knit2slides
mode: standalone
job: null
subtitle: Popular request session
framework: io2012
widgets     : [mathjax angularjs]  
highlighter : highlight.js
hitheme     : tomorrow 
---


<style>
  .title-slide {
    background-color:  #FF0000; /*; ; #CA9F9D*/
      /* background-image:url(http://goo.gl/EpXln); */
  }
</style>


<style>
.title-slide hgroup > h1, 
.title-slide hgroup > h2 {
  color: #F5F5F5 ;  /* ; #EF5150*/
}
</style>



--- 
## Goals of today's presentation

- Assignment 4 (Feedback)

- Functions with R

- Evaluation of the course

---
## Assignment 4

- Any comments?

---
## Functions in R


* R provides the necessary tools for creating your custom functions

* Functions -> Code for executing a set of instructions

---
### Building a function in R

Function that does nothing

```r
name <- function() {

  }
```

---
### Building a function in R

Function that does something but does not return anything


```r
name <- function() {
  doSomething
  }
```

---
### Building a function in R

Function that does something and it returns something as well


```r
name <- function() {
  res <- doSomething
  return(res)
  }
```

---
### Building a function in R

Function with arguments


```r
name <- function(argument) {
  res <- doSomething(argument)
  return(res)
  }
```

---
### Building a function in R

Function with default arguments


```r
name <- function(argument = TRUE) {
  res <- doSomething(argument)
  return(res)
  }
```

---
### Function for computing median per columns


```r
compute.median <- function(x){
  res <- apply(x, 1, median)
  return(res)
}
my.mat <- matrix(1:10, 2, 5)
compute.median(my.mat)
```

```
## [1] 5 6
```


---
### Function for computing median per columns, define default arguments


```r
compute.median <- function(x, remove.na = TRUE){
  res <- apply(x, 1, median, na.rm = remove.na)
  return(res)
}
my.mat <- matrix(1:10, 2, 5)
my.mat[1, 1] <- NA
compute.median(my.mat)
```

```
## [1] 6 6
```

```r
compute.median(my.mat, remove.na = FALSE)
```

```
## [1] NA  6
```

---
### Function for computing median per columns, additional arguments


```r
compute.median <- function(x, ...){
  res <- apply(x, 1, median, ...)
  return(res)
}
my.mat <- matrix(1:10, 2, 5)
my.mat[1, 1] <- NA
compute.median(my.mat)
```

```
## [1] NA  6
```

```r
compute.median(my.mat, na.rm = TRUE)
```

```
## [1] 6 6
```

---
### Function inside implicit loop


```r
my.mat <- matrix(1:10, 2, 5)
apply(my.mat, 1, function(x) {median(x)})
```

```
## [1] 5 6
```

---
### Goals of the course

* Goals of the course

* Get you excited

* Lose your fears about programming

* Learn the very basic of how R works

* Be able to manage your data, perform basic analyses, make plots, and create custom functions

* Have fun!

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
