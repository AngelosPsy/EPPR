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
#' - Gain experience with explicit looping
#' - Gain experience with basic plots
#' 
#' ## Exercise 1
#' Check the links below for more information on implicit looping in R.
#' - [Apply family](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family)
#' 
#' This is a nice article, but quite advanced [The Split-Apply-Combine Strategy for Data Analysis](https://www.jstatsoft.org/article/view/v040i01).
#'
#' ## Answer 1
#' Done.
#' 
#' ## Exercise 2
#' There are so many tutorials on plots out there. Indeed it looks like everyone who has just a simple 
#' idea about R, has to write a tutorial. Here is a list that you may want to check:
#' 
#' - [http://www.harding.edu/fmccown/r/](http://www.harding.edu/fmccown/r/)
#' - [http://www.r-tutor.com/elementary-statistics/qualitative-data/bar-graph](http://www.r-tutor.com/elementary-statistics/qualitative-data/bar-graph)
#' - [http://www.r-tutor.com/elementary-statistics/quantitative-data/scatter-plot](http://www.r-tutor.com/elementary-statistics/quantitative-data/scatter-plot)
#' - [https://flowingdata.com/2012/12/17/getting-started-with-charts-in-r/](https://flowingdata.com/2012/12/17/getting-started-with-charts-in-r/)
#' 
#' A few years ago, I even wrote a tutorial [here](https://github.com/AngelosPsy/AtinyIntroductionOnGraphsWithR/releases). Please do not read it -- it is crap -- but you can check the 'Tips and Tricks' chapter
#' at the end.
#'
#' ## Answer 2
#' Done.
#' 
#' ## Exercise 3
#' Run the code below.
#' eval = FALSE
x <- data.frame(ID = paste0("Part_", 1:2000), CS = 1:10, USExp = runif(2000, -5, 5))
#' Compute, seperately, the mean and standard error (check the package plotrix for that) for every CS. 
#'
#' ## Answer 3
library(plotrix)
x <- data.frame(ID = paste0("Part_", 1:2000), CS = 1:10, USExp = runif(2000, -5, 5))
tapply(x$USExp, x$CS, mean)
tapply(x$USExp, x$CS, std.error)

#' ## Exercise 4
#' Run the code below
#' eval = FALSE
my.list <- list(Group = rep(1:2, each = 100), EMG1 = rnorm (200, 500, 50), EMG2 = rnorm (200, 480, 40))
#' a) Convert the object above to a data frame
#' 
#' ## Answer 4a
my.list <- list(Group = rep(1:2, each = 100), EMG1 = rnorm (200, 500, 50), EMG2 = rnorm (200, 480, 40))
my.df <- data.frame(my.list)
#' 
#' b) Create a new column named "EMGDiff". Compute the difference between EMG1 and EMG2 *for* every participants using a function from
#' the apply family [Please note, that you could use vectorization or an explicit loop here. The point of this excercise, thought,
#' is that you gain a bit of experience with implicit looping]. Fill in the column EMDiff with the values you have computed.
#' 
#' ## Answer 4b
my.df$EMDiff <- apply(my.df[, 2:3], 1, diff)
#' c) Compute the log of EMG1 and EMG2 (?log). By using a function from the apply family, compute the median of the logarithm
#' of EMG1 and EMG2 -- not for EMGDiff.
#' 
#' Answer 4c
apply(log(my.df[, 2:3]), 2, median)
#' OR -- Although we have not seen this in class
apply(my.df[, 2:3], 2, function(x) median(log(x)))
#' Exercise 5
#' This exercise is based on parts of exercise 7 of the previous assignment.
#' First, run the code below
#' eval = FALSE
my.data.list <- list()
for (i in 1:100){
  my.data.list[[i]] <- c(NA, rnorm(10000, mean = 600, sd = 50))
}
#' a) Using a function from the apply family, first center (?scale) all values from all list 
#' elements. Save that new list into the object *my.data.list.center*.
#' 
#' Answer 5a
my.data.list.center <- lapply(my.data.list, scale, scale = FALSE)
#' b) Compute the mean of each list element of the my.data.list.center (hint: you may want
#' to check the mean function if you want to deal with NAs).
#' 
#' Answer 5b
mean.list <- lapply(my.data.list.center, mean, na.rm = T)
#' 
#' ## Exercise 6
#' Plot the means of the CSs that you computed at exercise 3 as a barplot. Make sure that
#' - Every bar should have a different color
#' - the names should be on the bottom of each plot
#' - The label on the y axis should read "CS Mean".
#' 
#' ## Answer 6
barz <- tapply(x$USExp, x$CS, mean)
barplot(barz, col = 1:10, names.arg = 1:10, ylab = "CS Mean")
#' Note: As noted by Sophie, the names.arg could be avoided -- the barplot names
#' the bars from 1 to 7. However, it is good to know how to do it on your own.
#' For example, you could say 'names.arg = paste('CS', 1:10)', to have something
#' different.
#' ## Exercise 7
#' One challenge with plots, is that sometimes I find a plot that I really like,
#' but do not know how to reproduce it. The goal of this exercise is to train you
#' on how you can find information -- based on the help files and the links above --
#' in order to reproduce a plot that is provided below. 
#' So, here I have some data
x <- c(0, 0, NA, 0, 1, 2, 3, 4, 5, NA, 5, 4, 3, 2, -1, -5)
y <- c(0, 0, NA, 0, -1, -2, -3, -4, -5, NA, -5, -5, -5, -5, -5, -5)
#' 
#' With these data, make the plot that you can see on that [link](https://www.dropbox.com/s/fdsthlzfw5rmwko/plotGraph.png?dl=0).
#' If you find it difficult, you can always check the hints document, that has step
#' to step hints. But maybe first try to see how far you can go on your own.
plot(x, type = "b", pch = 19, xlab = "", ylab = "", axes = FALSE)
points(y, type = "b", col = "red", pch = 15)
axis(1, c(1:2, 4:9, 11:16), paste0(rep(c("H", "A", "E"), c(2, 6, 6)), c(1:2, 1:6, 1:6)))
axis(2, c(-5, 0, 5), c(-5, 0, 5), las = 1)
graphics::mtext("Fear Ratings", 2, font = 4, cex = 2.5, line = 2)    
graphics::mtext("Trials", 1, font = 4, cex = 2.5, line = 3)     
