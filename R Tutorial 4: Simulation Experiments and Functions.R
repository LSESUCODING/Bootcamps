# R Tutorial 4: Functions and Simulations

# Writing your own functions
fn = function(arg1){ # define a function using functionname = function(arguments)
  if(arg1 <= 0){ # inside the curly brackets, define what you want your function to do
    100}
  else{
    2 + fn(arg1 - 1)}
}

m = fn(5) # call the function to see it in action
m
fn(-5)

# Remember to use your curly brackets

# Simulation Experiment 1
# We are defining a function to get the sample mean, so we are simulating taking the mean of many samples
poisSampleMean = function(n, lambda, r){ # we want our samples to be of size n, take parameter lambda for the Poisson distribution, and repeat sampling r times
  simvals = rpois(n*r, lambda) # we generate n*r simulated values 
  simvals = matrix(simvals, n, r) # we put the values into a matrix of n rows and r columns (columns represent each sample)
  colMeans(simvals) # we take the mean of each sample, i.e. take the sample of each column in the matrix
}

set.seed(1) # standardizes a level of randomness so results are similar across different machines
poisSampleMean(10,3,6) # these are our calculated sample means from 6 simulated samples each of size 10

# Simulation Experiment 2
# Create a way of comparing the real data distribution to a theoretical one
histNorm = function(data, nbins = 21){ # we want our function to take data and have a number of bins equal to 21 by default
  hist(data, breaks = seq(min(data), max(data), length=nbins), probability = TRUE, col = 5) # our functino is going to create a histogram from our data, dividing the data according to a sequence from the minimum value of the data to the maximum, broken up into 21 numbers
  x = seq(min(data), max(data), length = 200) # we now create another sequence of numbers from the minimum of the data to the maximum with length 200
  lines(x, dnorm(x), mean = mean(data), sd = sd(data), col = 2) # add a curve to the histogram that calculates the normal probability for each number in our x sequence
}

histNorm(poisSampleMean(8, 1, 1000)) # a histogram created from the function we defined to see if the data is normally distributed

# Simulation Experiment 3
# We will do the same kind of thing as before but with a different distribution
binomplot = function(size, prob = 0.5, colour = 3, outputvals = FALSE){ # size of observation set, probability for binomial
  x = 0:size # we define a sequence of numbers from 0 to the size we will specify when we call our function
  y = dbinom(x, size, prob) # calculate the binomial probability for each x value
  plot(x, y, type = "h", col = colour) # plot the probability of each x in a histogram
  if(outputvals) y # if we want to display each output value y, then outputvals = TRUE and we print y
}

binomplot(50)
binomplot(55, outputvals = TRUE, colour = 1) # specify non default values: output values T, colour gray

#Exercise 1
add_col = function(M,v) {
  if(nrow(M)==length(v)) {
    M = cbind(M,v)
  }
  return(M)
}

# Exercise 2
newVector = function(v) {
  v = sort(v)*2
  return(v)
}

# Exercise 3
dataframe = function(str) {
  A = unlist(strsplit(str,'/'))
  M = rbind(unlist(strsplit(A[1], ':')), unlist(strsplit(A[2], ':')), unlist(strsplit(A[3], ':')))
  return(M)
}

# Exercise 4
install.packages("stringr")
install.packages("stringi")
library(stringr)
library(stringi)

anagram = function(a, b) {
  x = unlist(stri_extract_all(a, regex = c('\\p{L}')))
  y = unlist(stri_extract_all(b, regex = c('\\p{L}')))
  if (length(x) == length(y)) {
    cond = unique(x%in%y==y%in%x)
    cat('anagram:', ifelse(length(x)==length(y) & length(cond)==1, ifelse(cond==TRUE,TRUE,FALSE),FALSE))
  }
  if (length(x)!=length(y))
    cat('anagram: FALSE')
}

A = "present"
B = "serpent"
anagram(A,B)

# Exercise 5
ORDERWORD=function(a)
{
  x=unlist(stri_extract_all(a, regex=c('\\p{L}')))
  POSITION=which(letters%in%x)
  return(POSITION)
}
