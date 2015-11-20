#+ Angelos Krypotos
#+ 19/11/2015
#+ Example script to be shown during class

#' Clear workplace
rm(list = ls(all = TRUE))

#' Generate data -- just for the example. In general, you should have your own data
for (i in 1:2000){
  datz = cbind(ID = i, RTCOnd1 = rnorm(n = 20, mean = 600, sd = 20), RTCOnd2 = rnorm(n = 20, mean = 500, sd = 10))
  filename = paste0("datz", i, ".csv")
  write.csv(x = datz, file = filename, quote = FALSE, row.names = FALSE)
}

#' Read all data that have the ".csv" extension have. Save them in the myData object
myData = lapply(list.files(pattern = ".csv"), read.csv)

#' Compute the mean of the 2nd and 3rd column of every file
RTperSubj = lapply(myData, function(x) colMeans(x)[2:3])

#' Put them all in a matrix
dataMat = do.call("rbind", RTperSubj)

#' Plot the results
barplot(colMeans(dataMat))

#' Check the meas of each column and SD
colMeans(dataMat)
apply(dataMat, 2, sd)

#' Perform a paired t-test
t.test(dataMat[, 1], dataMat[, 2], paired = TRUE)

