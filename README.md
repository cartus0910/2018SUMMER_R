### 2018SUMMER_R
> INFORMATIONS
* Name: Cartus You
* ID: B06208002
* Dep.:NTU Geography
* GROUP member: [王良軒](https://github.com/jason10130021/CS-X_106_Summer), [張銚軒](https://github.com/NTU-CSX-DataScience/106Summer/blob/master)

## WEEK 1
[week1_link](https://n2-data-science-programming.gitbook.io/rsummer/week_1)
> PREPARE
* Download R & RStudio
* Read the reserved words in R

> EXERCISES
* Calculation in R
* Variable types in R
* Use R markdown to create a document 

> HW1
* Create repository for this class
* Create folder as week1
* Add hw1.Rmd as a note of this week
* [hw_link](https://cartus0910.github.io/2018SUMMER_R/week1/hw1.html)

## WEEK 2
[week2_link](https://n2-data-science-programming.gitbook.io/rsummer/week_2)
> PREPARE
* Install packages:ggplot, ggmap, scales
* Read the Document of ggplot

> EXERCISES_MORNING
* Use the build-in dataframe: diamond
* draw several diagrams including: bar, histogram, point, boxplot
* [exercise_part1_link](https://cartus0910.github.io/2018SUMMER_R/week2/0711morning.html)

> EXERCISES_AFTERNOON
* Create function to connect URL
* Use function to crawl the website
* Organizing data by filtering out unnecessary data
* Create wordcloud
* [exercise_part2_link](https://cartus0910.github.io/2018SUMMER_R/week2/0711afternoon.html)

> EXTRA 1
* Calculate the most-used words in the title of thesis in NTU Geography
* Download data from [National Digital Library of Theses And Dessertation in Taiwan](https://etds.ncl.edu.tw/cgi-bin/gs32/gsweb.cgi/ccd=MFzs7f/webmge?switchlang=en)
* Import the data as .csv
* Create wordcloud and lettercloud (NOTE: The letter cloud cannot adjust the word size relatively to the frequency)
* [extra_practice_link1](https://cartus0910.github.io/2018SUMMER_R/week2/geog_paper.html)

> EXTRA 2
* Download the data of Debris Flow Monitoring Station
* Use ggplot to plot the stations on the map
* [extra_practice_link2](https://cartus0910.github.io/2018SUMMER_R/week2/0717MAP)

## WEEK 3
[week3_link](https://n2-data-science-programming.gitbook.io/rsummer/week_3)
> PREPARE
* Read the document of EDA, TI-IDF, PCA, K-means.
* Review the homework last week.

> EXERCISES_MORNING
* Download data from [新北市歷年重大災害一覽表](https://data.gov.tw/dataset/33645), [遭受災害救助情形](https://data.gov.tw/dataset/56813)
* Determine the purpose: Find out whether the intervals in which the major disaster happened have higher emergency allowance.
* Found conclusion: No, there is no positive correlation between the two.
* Check the data and point out the deficiency of the original data.
* [exercise_part1_link](https://cartus0910.github.io/2018SUMMER_R/week3/0718morning.html)

> EXERCISES_AFTERNOON
* Crawl the data from PTT movie boards.
* Restore the content by the time of posting(hours).
* Calculate TF and IDF for the data and create TF-IDF matrix for each hours.
* [exercise_part2_link](https://cartus0910.github.io/2018SUMMER_R/week3/0718afternoon_only_TF-IDF_.html)
(**Note that this only include TF-IDF process**)
* Get the introduction of best selling books in 5 popular online book store(誠品:C、博客來:B、TAAZE:T、城邦:P、金石堂:J).
* Calculate TF and IDF for the data and create TF-IDF matrix for each book introduction.
* Create the word cloud to see the key words in all document.
* Use PCA to reduce the dimensionality.
* Plot the result to check the degree of decentralization.
* Determine optimal number of clusters
* Use k-means to classify each introductions into 5 clusters
* [exercise_part3_link](https://cartus0910.github.io/2018SUMMER_R/week3/0718afternoon.html)
(**This is the HW with process of TFIDF -> PCA -> K-means**)
