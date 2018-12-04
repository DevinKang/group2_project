#	Date: 12/03/18
#	Author: Will Traweek
#
#	Trims the datasets to better work within our requirements
#	Successfully trims the datasets from ~60 mb to ~17 mb
#	This allows us to much more easily and quickly manipulate the data
#

#grabs the current directory to later move back to
wd <- getwd()
setwd("../data")
tweets <- read.csv("tweets.csv", stringsAsFactors = FALSE)
users <- read.csv("users.csv", stringsAsFactors = FALSE)
#resets to original directory
setwd(wd)

#A list of columns to drop from the table
drops <- c("retweeted_status_id","in_reply_to_status_id", "mentions", "posted", "created_at", "source")
tweets <- tweets[, !(names(tweets) %in% drops)]

#A list of columns to drop from the table
drops <- c("verified", "time_zone", "description", "lang")

#want to get rid of all non english entries to make it easier to analyze and read
#non english entries would be difficult to read anyways from a coding standpoint, so this should alleviate those concerns
users <- users[users$lang=="en",]
users <- users[, !(names(users) %in% drops)]

#grabs the current directory to later move back to
wd <- getwd()
setwd("../data")
#uses default save function.  in order to load, move to directory and use the load() function.
#The variables will be automatically loaded with the names they have here
save(tweets, file="tweets.RData")	#59.1mb to 16.8mb
save(users, file="users.RData")		#98kb to 16kb
#resets to original directory
setwd(wd)