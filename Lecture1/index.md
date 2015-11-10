---
title: "R for EPP"
author: "Angelos Krypotos"
knit: slidify::knit2slides
mode: standalone
job: null
subtitle: A basic introduction
framework: io2012
widgets    : [bootstrap, quiz, shiny, interactive]
ext_widgets: {rCharts: [libraries/nvd3]}
---

[//]: # (Change the background color of the title slide)

<style>
  .title-slide {
    background-color:  #EDE0CF; /*; ; #CA9F9D*/
      /* background-image:url(http://goo.gl/EpXln); */
  }
</style>

<style>
slide.smallcode pre {
  font-size: 11px;
}
</style>

<div style='text-align: center;'>
    <img width = '900' height='700' src='images/noreturn.jpg' />
</div>

--- &twocol

## Welcome

*** =left

> - Goal of today is to show you what R can do

> - 2-hours are not enough though...

> - But I will show what is relevant for your research

*** =right 


<div style='text-align: center;'>
    <img height='300' src='images/Rlogo.png' />
</div>


---

## The thing called R

> - R is a programming language widely used for statistics

> - Born: 1993

> - After 22 years, R is more popular than every before!

> - But why?

---

## Why R is cool

> - R allows a wide array of statistical analyses

> - If used in combination with other languages (markdown) you
can get reports of data

> - It is actually free and plenty of online resources are free

> - Open source

> - Large supporting community

<div style='text-align: center;'>
    <img height='250' src='images/cool.jpg'/>
</div>

---

## Why R is hot

> - The type of analyses served by R are growing expondentually

> - R is growing, alternative statistical programs (e.g., SPSS) remain largely the same

> - Reproducable research

> - R studio

> - The work of Hadley Wickham and Yihui Xie

> - 

<div style='text-align: center;'>
    <img height='400', width = '400', src='images/fire.jpg'/>
</div>



---

## So what can R do for me?

<div style='text-align: center;'>
    <img height='300' src='images/demo.jpg'/>
</div>

> Fingers crossed!


---
## Simple stuff that you can do in R


```r
"Hello, World!"
```

[1] "Hello, World!"



```r
2 + 2
```

[1] 4


```r
1000/10
```

[1] 100


```r
1:10 - .5
```

 [1] 0.5 1.5 2.5 3.5 4.5 5.5 6.5 7.5 8.5 9.5

---

## Statistical analyses with R



```r
anxiety <- c(20, 30, 40, 15, 34, 21)
groups  <- rep(1:2, each = 3)
t.test(anxiety~ groups)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  anxiety by groups
## t = 0.82832, df = 3.9966, p-value = 0.4541
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -15.68695  29.02028
## sample estimates:
## mean in group 1 mean in group 2 
##        30.00000        23.33333
```

---
## Bayesian t-test


```r
library(BayesFactor)
anxiety <- c(20, 30, 40, 15, 34, 21)
groups  <- rep(1:2, each = 3)
ttestBF(anxiety[groups == 1], anxiety[groups == 2])
```

```
## Bayes factor analysis
## --------------
## [1] Alt., r=0.707 : 0.6789284 ±0.01%
## 
## Against denominator:
##   Null, mu1-mu2 = 0 
## ---
## Bayes factor type: BFindepSample, JZS
```

--- 
## R plots


```r
layout(t(1:3))
plot(1:10, type = "b")
hist(rnorm(1000))
barplot(matrix(1:4, 2, 2), beside = T, col = 1:4)
```

<img src="assets/fig/unnamed-chunk-7-1.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />

---
## R plots


```r
library(ggplot2)
qplot(age, circumference, data = Orange, geom = c("point", "line"), colour = Tree)
```

<img src="assets/fig/unnamed-chunk-8-1.png" title="plot of chunk unnamed-chunk-8" alt="plot of chunk unnamed-chunk-8" style="display: block; margin: auto;" />


--- &interactive
## Interactive Console

<!-- MotionChart generated in R 3.2.2 by googleVis 0.5.10 package -->
<!-- Tue Nov 10 13:51:12 2015 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataMotionChartID145017c411f8 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Apples",
2008,
"West",
98,
78,
20,
"2008-12-31" 
],
[
 "Apples",
2009,
"West",
111,
79,
32,
"2009-12-31" 
],
[
 "Apples",
2010,
"West",
89,
76,
13,
"2010-12-31" 
],
[
 "Oranges",
2008,
"East",
96,
81,
15,
"2008-12-31" 
],
[
 "Bananas",
2008,
"East",
85,
76,
9,
"2008-12-31" 
],
[
 "Oranges",
2009,
"East",
93,
80,
13,
"2009-12-31" 
],
[
 "Bananas",
2009,
"East",
94,
78,
16,
"2009-12-31" 
],
[
 "Oranges",
2010,
"East",
98,
91,
7,
"2010-12-31" 
],
[
 "Bananas",
2010,
"East",
81,
71,
10,
"2010-12-31" 
] 
];
data.addColumn('string','Fruit');
data.addColumn('number','Year');
data.addColumn('string','Location');
data.addColumn('number','Sales');
data.addColumn('number','Expenses');
data.addColumn('number','Profit');
data.addColumn('string','Date');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartMotionChartID145017c411f8() {
var data = gvisDataMotionChartID145017c411f8();
var options = {};
options["width"] =    600;
options["height"] =    500;
options["state"] = "";

    var chart = new google.visualization.MotionChart(
    document.getElementById('MotionChartID145017c411f8')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "motionchart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartMotionChartID145017c411f8);
})();
function displayChartMotionChartID145017c411f8() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMotionChartID145017c411f8"></script>
 
<!-- divChart -->
  
<div id="MotionChartID145017c411f8" 
  style="width: 600; height: 500;">
</div>

--- .smallcode
## Twitter





```r
library(twitteR)
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
```

[1] "Using direct authentication"

```r
twiz <- searchTwitter("@KevinvSchie", 6)
twizSN <- do.call("rbind", lapply(twiz, function(x) paste0("@", x$screenName)))
barplot(table(twizSN), col = "skyblue", main =  "Kevin's biggest twitter fans!")
```

![plot of chunk unnamed-chunk-11](assets/fig/unnamed-chunk-11-1.png) 








