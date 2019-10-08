# Review from previous
M = matrix(rnorm(16, 10, 5), 4, 4)
M
means = matrix(rep(10, 16), 1, 4)
means
sd = matrix(rep(5, 16), 1, 4)
sd

unnormalized = sweep(sweep(M, 2, sd, "*"), 2, means, "+")
unnormalized

# Grep and Grepl
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

grepl(pattern="edu", x=emails) # match for edu
hits<-grep(pattern="edu", x=emails)
hits
emails[hits] # subset emails

# Use grepl() to match for .edu addresses more robustly
grepl(pattern="@.*\\.edu", x=emails) # \ tells R we want to include the dot

# Use grep() to match for .edu addresses more robustly, save result to hits
hits<-grep(pattern="@.*\\.edu", x=emails)

# Subset emails using hits
emails[hits]

# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "global@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use sub() to convert the email domains to lse.ac.uk
sub(pattern="@.*\\.edu$", replacement="@lse.ac.uk",x=emails)

# Get the current date: today
today<-Sys.Date()
today
# Get the current time: now
now<-Sys.time()
now

# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2)
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")

# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2)

# Convert times to formatted strings
format(time1,"%M")
format(time2,"%I:%M %p")

# day1, day2, day3, day4 and day5 are already available in the workspace
day1<-as.Date("2018-11-06")
day2<-as.Date("2018-11-08")
day3<-as.Date("2018-11-13")
day4<-as.Date("2018-11-19")
day5<-as.Date("2018-11-24")

# Difference between last and first pizza day
day5-day1

# login and logout are already defined in the workspace

logout<-as.POSIXct(c("2018-11-10 10:56:29 UTC", "2018-11-15 09:14:52 UTC", "2018-11-15 12:35:48 UTC", "2018-11-15 13:17:22 UTC","2018-11-17 22:08:47 UTC"))

login<-as.POSIXct(c("2018-11-10 10:18:04 UTC", "2018-11-15 09:14:18 UTC", "2018-11-15 12:21:51 UTC", "2018-11-15 12:37:24 UTC", "2018-11-17 21:37:55 UTC"))

# Calculate the difference between login and logout: time_online
time_online<-logout-login

# Inspect the variable time_online
time_online

# Calculate the total time online
total_time_online<-sum(time_online)
total_time_online
# Calculate the average time online
mean_time_online<-mean(time_online)
mean_time_online

