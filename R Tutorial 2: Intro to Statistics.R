# R Tutorial 2: Summary Statistics

# Review of Logic: Write a while loop that prints out standard random normal numbers and stops when you get the first number bigger than 1
while (TRUE) {
  x = rnorm(1)
  print(x)
  if (x > 1) {
    break
  }
}

# Coding Challenge Answer
weather = readline(prompt = "What is the weather today?: ")
temp = as.integer(readline(prompt = "What is the temperature?: "))
if ((weather == "raining") & (temp < 10)) {
  print("Bring jacket and umbrella")
} else if (weather == "raining") {
    print("Bring umbrella")
} else if (temp < 10) {
  print("Bring jacket")
} else {
  print("Weather is good today")
}
}

install.packages("ISLR") # install package from R
library(ISLR) # you must library packages before using them

View(Carseats) # view the Carseats dataset that is built into ISLR
summary(Carseats) # shows min, Q1, median, mean, Q3, max for each column

Carseats = as.data.frame(Carseats) # create Carseats as a data frame
attach(Carseats)
Carseats = subset(Carseats, select = -ShelveLoc) # practice removing a column from a data set
View(Carseats)


library(MASS)
summary(Boston$crim) # only the summary of crime column

# Probability Calculations
pbinom(q = 60, size = 85, prob = 0.6)
pnorm(q = 15, mean = 12, sd = 3, lower.tail = FALSE)
pbinom(q = 59, size = 85, prob = 0.6) * pnorm(q = 15, mean = 12, sd = 3, lower.tail = FALSE)  

# pdistributionname calculates probability P(X <= x)

x = seq(from = -3, to = 3, length = 200)
plot(x, dnorm(x), type = "l") # ddistributionname calculates probability P(X =x)
lines(x, dt(x, df = 16), col = 2) # tdistribution with different degrees of freedom
lines(x, dt(x, df = 8), col = 3)
lines(x, dt(x, df = 4), col = 4)

# In determining which distribution is appropriate for a set of data, a plot comparing the empirical density with the theoretical density is useful
x = seq(from=0, to=20, length = 200)
hist(Carseats$Sales, breaks = seq(0, 20, length = 10), probability = TRUE) # hist creates a histogram
lines(x, dnorm(x, mean = mean(Carseats$Sales), sd = sd(Carseats$Sales)), col = 2)

# Sampling: rdistributionname samples from the distribution specified
poissamp = rpois(n = 400, lambda = 2) # sample of size 400 with lambda 2
hist(poissamp, breaks = 0:10, probability = TRUE)

normsamp = rnorm(n = 250, mean = 10, sd = 5)
hist(normsamp, breaks=seq(-10,30,length=15), probability = TRUE)

x = seq(-10,30,length=200)
lines(x, dnorm(x, mean = 10, sd = 5), col = 2)

# Set seed: ensures degree of randomness is the same
set.seed(1)
rnorm(5)

# Sampling vectors from data
nvec = 1:16
sample(nvec) # without replacement
sample(nvec, size = 3) # vector of length 3
sample(nvec, replace = TRUE) # with replacement
sample(nvec, size = 10, replace = TRUE)

# Hypothesis Testing
# T Tests:
samp1 = rnorm(500, 12, 3)
samp2 = rpois(500, lambda = 5)
t.test(samp1, samp2) # difference in means or one sample t test

binom.test(5, 100, 0.5) # test true probability of success
