### 2018SUMMER_R
> INFORMATIONS
* Name: Cartus You
* ID: B06208002
* Dep.:NTU Geography
> Task each week

    [WEEK1_HW](https://cartus0910.github.io/2018SUMMER_R/week1/hw1.html)
    [WEEK2_HW1](https://cartus0910.github.io/2018SUMMER_R/week2/0711morning.html) | [WEEK2_HW2](https://cartus0910.github.io/2018SUMMER_R/week2/0711afternoon.html) | [WEEK2_EXTRA](https://cartus0910.github.io/2018SUMMER_R/week2/geog_paper.html) 
    [WEEK3_HW1](https://cartus0910.github.io/2018SUMMER_R/week3/0718morning.html) | [WEEK3_PARTIAL](https://cartus0910.github.io/2018SUMMER_R/week3/0718afternoon_only_TF-IDF_.html) | [WEEK3_HW2](https://cartus0910.github.io/2018SUMMER_R/week3/0718afternoon.html) 
    [WEEK4_HW](https://cartus0910.github.io/2018SUMMER_R/week4/0725morning.html)

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


## WEEK 4
[week4_link](https://n2-data-science-programming.gitbook.io/rsummer/week_4)
> PREPARE
* Download data from [Student Alcohol Consumption Survey](https://www.kaggle.com/uciml/student-alcohol-consumption).
* Set the initial purpose of this project: Examines whether alcohol consumption has any predictive power over student average grades.

> EXERCISES
* Use EDA to organizing the data.
* Plot to see the relationships bwtween alcohol consumption and grades.
* Combine the two grades together without worrying the lost of features after calculated the adjusted R squared to make sure it works.
* Run T-test to see whether having alcohol consumption or not influence the their academic performance?
* Set h0 = "Having alcohol consumption or not will not influence the their academic performance?" and h1 = "Having alcohol consumption or not will influence the their academic performance?"
* P-value < 0.05, so h0 is rejected in favor of h1 within the 95% confidence interval.
* Plot to see how workday and weekend alcohol consumption influence on average grades.
* Conclude that levels of alcohol consumption have a limited predict power over their grades.
* Set the purpose for next stage:
  1. Examine which variable has the most predicative power over student grades.
  2. Build model to predict the grades.
* Use linear model to find the variables having significant impact on grades, which are studytime, schoolsup(Extra educational support), higher(Wants to take higher education).
* Check the three variables found above is more important in this model using ANOVA.
* Find out that aiming to having higher education or not is the most important variable.
* Build a regression tree model to see how the top important variables affect the grades.
* Calculate normalized mean squared error to see the accuracy of these two models.
* Plot to see how these two models work, and see that they are not quite predictive.
* Build Random Forest model instead.
* Calculate the NMSE of this model, and then get the result of about 0.2, which indicate that this model is more valid than the ones above.
* Plot to see that random forest model works well comparing to the others, though it seems to underpredict the grades of the group of lower grades student, and overpredict the grades of the group of higher grades students.
* Plot to see which variables are important in this model.
* Produce a partial dependence plot for each feature in the best performing Random Forest model with 500 trees., giving a graphical depiction of the marginal effect of a feature on the response.
* Give a look at some features which would be conventionally thought as important using correlational plot.
* Got the conclusion!
* [exercise_link](https://cartus0910.github.io/2018SUMMER_R/week4/0725morning.html)
