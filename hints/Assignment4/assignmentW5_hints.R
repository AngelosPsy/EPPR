#' ---
#' title: "R for EPP research\n Assignment 3"
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
#' ## Goals of the assignment
#' - Gain experience in statistical analyses using R
#' 
#' ## Exercise 1
#' Check the links below for refreshing what we did in class (+ the slides of course):
#' 
#' * [t-tests](http://www.statmethods.net/stats/ttest.html)
#' 
#' * [Correlations](http://www.statmethods.net/stats/correlations.html)
#' 
#' * [The BayesFactor packages](http://bayesfactorpcl.r-forge.r-project.org/). A nice page for learning how to do
#' Bayesian analysis with the BayesFactor package.
#' 
#' ## No hints
#' 
#' ## Exercise 2
#' Run the code below.
#+ eval = FALSE
set.seed(100)
depression <- sample(10:40, 100, replace = TRUE)
sex <- c("Men", "Women")
df <- data.frame(depression, sex)
#' Check whether there are sex differences in terms of depression. Do that within:
#' 
#'  a) a frequentists framework, and
#' 
#' ## Hint
#'   
#'  ?t.test
#'  
#'  b) a Bayesian framework (by using the BayesFactor package)
#' 
#' ## Hint
#'    
#'  Check ?ttestBF in the BayesFactor package
#'  
#'  c) Does depression differ from 0?
#'  
#' ## Hint
#'  
#'  Check the 'mu' argument in the t.test function.
#'  
#'  d) For 2b, report the Bayes factor after changing the r scale parameter 
#'  to the values, .707, 1, and 2. 
#'  
#' ## Hint
#'  
#'  Check the rscale argument in the ttestBF function (see the BayesFactor package). 
#'  You can use a loop for running the fuction with the different rscale values or you can run
#'  the function 3 times.
#'  
#' ## Exercise 3
#' Run the code below
ID <- as.factor(rep(1:100, each = 4))
CS <- as.factor(c("+", "-"))
Trial <- as.factor(c(1, 1, 2, 2))
group <- as.factor(c("exp", "exp", "exp", "exp", "ctl", "ctl", "ctl", "ctl"))
RT <- rnorm(100, 5, 4)
df <- data.frame(ID, CS, Trial, group, RT)
#'
#' a) Run a repeated measures ANOVA in which you include CS and Trial as
#' within-subject factor. Include _no_ between-subject factors.
#' 
#' ## Hint
#' 
#' ?ezANOVA
#' 
#' b) Do the same using Bayes factors
#' 
#' ## Hint
#' 
#' ?anovaBF
#' 
#' c) Make a boxplot of RTs for each group
#'
#' ## Hint
#' 
#' ?boxplot
        