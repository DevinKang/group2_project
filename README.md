# Group 2 - Project Proposal
**Names:** Devin Kang, Will Traweek, Marvin Oida, Nick Young

# Project Description
  * Dataset: Dataset of 200,000 Tweets by Russian “trolls”
  * [Data Source from NBC](https://www.nbcnews.com/tech/social-media/now-available-more-200-000-deleted-russian-troll-tweets-n844731?cid=sm_npd_nn_tw_ma) (csv files in middle of page).
    * CSV includes information (but not limited to) date posted, online alias, the tweet itself, number of favorites it got, and hashtags used.

# Target Audience
Those interested in the influence of these tweets on American politics.

# What audience wants to learn
  * What types of tweets these bots are sending out
  * What are the common themes between these tweets
  * What are the relevant hashtags and trends involved with these tweets

# Technical Description
**Format:** Shiny app

**Data:**
  * tweet.csv: A 50 MB csv of Tweets
    * Relevant Information:
      * *text*: the actual Tweets
      * *hashtags*: hashtags associated with each tweet    
  * users.csv: A csv of usernames

**Wrangling:**
  * Trimming down the dataset by getting rid of all data that isn’t immediately necessary and joining the data to make it easier to publish in tweet format.

**Libraries:**
  * tidyverse
  * ggplot2
  * mapproj

**Statistical Analysis/Machine Learning** None

**Challenges:**
  * Sorting data efficiently
  * Turning an analysis of the data into meaningful interactive representations and diagrams
