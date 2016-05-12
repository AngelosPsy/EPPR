#' ---
#' title: "R for EPP research\n Assignment 5"
#'author: "Angelos-Miltiadis Krypotos"
#'date: "`r Sys.Date()`"
#'---
#'
#' Name : [Put your name here]
#'
#' ## General instructions.
#' 
#' ## How to complete the assignment.
#' Please write your answers below each question, indicating clearly to which question (or subquestion) your answer refers to.
#' I would prefer if you would send your answers as an html document using "knitr" and with all the code having been already executed. 
#' You can create html documents in R studio by just clicking the notepad icon on the top -- For more info how to create notebooks in R studio see 
#' [here](https://support.rstudio.com/hc/en-us/articles/200552276-Creating-Notebooks-from-R-Scripts). If you want, you can also send
#' your answers as an .R script. Lastly, writing your assignments in .doc or .docx is also OK, but because of automatised formatting etc., it
#' would be hard for me to check whether the code is running properly or not.
#'
#' Please go crazy with creating your functions. In the end, you can develop your function as much as you like. So, do it!
#'
#' ## Goals of the assignment
#' - Gain experience with creating your own functions in R
#' 
#' ## Exercise 1
#' Check the lecture slides. In addition, go through [this webpage] (https://www.datacamp.com/community/tutorials/functions-in-r-a-tutorial) and
#' [this chapter](http://adv-r.had.co.nz/Functional-programming.html). The latter one is advanced but you can get an idea about what are the good practices when writing R functions.
#' 
#' ## Answer 1
#' 
#' Done
#' 
#' ## Exercise 2
#' Make a function that takes as arguments two numeric vectors. The output of the function is the Bayes factors of a paired samples Bayesian
#' t-test. Use the 'Bayesfactor' package for computing the Bayes factor.
#' 
#' ## Answer 2
#' 
library(BayesFactor)
MyBayesFunction <- function(x, y){
  res <- ttestBF(x, y, paired = TRUE)
  return(res)
}
#'
MyBayesFunction(rnorm(10, mean = 10), rnorm(10, mean = 12))
#'
#' 
#' ## Exercise 3
#' Create a new function, as in Exercise 2, but now the output is the Bayes factor when the rscale is set to .707, and to 1. You have to make sure
#' that the user knows which Bayes factor corresponds to which rscale.
#'
#' ## Answer 3
#'
#' This is a way to do so but it is not the best way. The best way would be to use a recursive function but we have not
#' talked about it in class.
#'  
library(BayesFactor)
MyBayesFunction2 <- function(x, y){
  res707 <- ttestBF(x, y, paired = TRUE, rscale = .707)
  res1 <- ttestBF(x, y, paired = TRUE, rscale = 1)
  
  res <- matrix(c(res707@numerator$Alt@prior$rscale, extractBF(res707)[["bf"]],
  res1@numerator$Alt@prior$rscale, extractBF(res1)[["bf"]]), 2, 2, byrow = T)
  colnames(res) <- c("rscale", "bf10")
  return(res)
}
#'
MyBayesFunction2(rnorm(10, mean = 10), rnorm(10, mean = 12))
#'
#' ## Exercise 4
#' Make a function that creates a scatterplot of a numeric vector. As arguments, the function should accept a numeric vector, and also the main title. Make
#' sure that the user can add other arguments as well, that change the behavior of the plot function.
#' 
#' ## Answer 4
ScatterPlot <- function(datz, title, ...){
  plot(datz, main = title, ...)
}
#'
ScatterPlot(datz = rnorm(100), title = "Silly Example")
#' 