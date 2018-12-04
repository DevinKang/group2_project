#	Date: 12/03/18
#	Author: Will Traweek
#
#	Analyzes the data for popular hashtags and plots them
#	

library("ggplot2")
library(dplyr)

wd <- getwd()
setwd("../data")
load("tweets.RData")
setwd(wd)

#removes tweets without a hashtag
hashtags <- tweets[tweets$hashtags != "[]",]

library(data.table)

#creates a frequency column and orders the rows by frequency
hashtags <- setDT(hashtags)[,freq := .N, by = c("hashtags")][order(-freq)]
#deletes all rows except for hashtag and frequency
hashtags <- select(hashtags, hashtags, freq)
#removes duplicated rows
hashtags <- hashtags[!duplicated(hashtags),]
#selects only the most frequently used hashtags
hashtags <- hashtags[freq > 250,]

#begins to plot the hashtags
plot <- ggplot(data=hashtags, aes(x=hashtags, y=freq)) +
		geom_bar(stat="identity", fill="black") + #creates the bar graph
		coord_flip() +	#flips the coordinates so that the hashtags can be read
		theme_minimal() +
		geom_text(aes(label=freq), vjust=0.5, hjust=1.15, color="white", size=2.5)	#creates the labels.  DO NOT MESS WITH VALUES

wd <- getwd()
setwd("../output")
ggsave(filename="hashtags.jpeg", plot=plot)
setwd(wd)