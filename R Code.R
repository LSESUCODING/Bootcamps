# Working Directory
getwd()
setwd("/Users/majalie/Desktop/LSESU CODESOC")

# Vectors
v <- c(1, 2, 3)
u <- c(3, 4 ,4)
v + u

v = v + 1
v

# Recycling Rule
small = c(1, 2)
big = c(0, 0, 0, 0)
small + big

# Sequences
1:10
10:1
2*1:10
1:10-3

seq(from=1, to=10, by=1)
seq(from=1, by=1, length=20)
seq(1,10,1)
seq(1,10,2)

# Data Frame
weight = c(84.5, 72.6, 75.7, 94.8, 71.3, 82.3)
height = c(86.5, 71.8, 77.2, 84.9, 75.4, 81.9)
sheep = data.frame(weight, height)

mean(sheep$height) # calculate summary statistics

View(sheep)
sheep$backlength = c(130.4, 100.2, 109.4, 140.6, 101.4, 99.7)
rm(height)
height
sheep$height

height
attach(sheep)
weight
detach()
height

# Arrays
A = array(data = 1:16, dim = c(4,4)); A
A = array(data = 1:13, dim = c(4,4)); A # Recycling Rule

A[1,2] # first row, second column element
A[1,] # entire first row

# Use indexing to remove data from an array by using "-" in front of the row or column we want to remove
B = A[-1, -1]; B

# Matrices
heightMatrix = matrix(sheep$height, 3, 2); heightMatrix
doubleheightMatrix = heightMatrix * 2; doubleheightMatrix

matrix = matrix(data = 1:6, 2, 3)
matrix = matrix + 2; matrix

product = matrix %*% t(matrix)
product

t(matrix) # transpose matrix
M = matrix(data = 1:4, 2, 2)
solve(M) # inverse of matrix M
M %*% solve(M)

newRow = c(5, 6); M = rbind(M, newRow); M
newCol = c(7, 8, 9); M = cbind(M, newCol); M

eigen(M) # returns eigenvalues and eigenvectors

# We can create matrices with the array function as well and specifying the dimensions in the second argument
C = array( c(1,3,2,1), c(2,2))
d = array (c(1,0), c(2,1))
solve(C,d)

# Clear memory
rm(list = ls())

# Logical operations - we need these to create our own functions
x = 10
y = 20
z = 10
x == y # means x is equal to y, should return as FALSE
x == z
x != y # means x is not equal to y, should return as TRUE
x > y
x <= y
x == z & x != y # AND function
x==z | x==y # OR function
! x == z # means whether x is NOT equal to z

# Loops (For and While) - we need to repeat something multiple times
# We need to let R know how many times to repeat a process in a 'for' loop
for (i in 1:5) print(i)


# We don't know how many times we need to repeat, but we know a condition for stopping --> use 'while' loop
i = 1;
while(i < 6){
  print(i)
  i = i + 1}
# If you forget the i + 1, the loop repeats forever because 1 is always less than 6

# Conditional Statements
y = rep("NA", times = length(x))
for(i in 1:length(x)){
  if (x[i] >= 0)
    y[i] = "non-negative"
  else
    y[i] = "negative"
}

x = seq(-5, 10, by = 1.5)
y = ifelse(x < 0, "negative", "non-negative")

# Review from R 1
while(TRUE) {
  x = rnorm(1)
  if (x < 0) {
    next
  }
  print(x)
  if(x > 1) {
    break
  }
}

# Summary Statistics
library(ISLR)
View(Carseats)
summary(Carseats)

library(MASS)
summary(Boston$crim)

# Probability and Quantile Calculations
pbinom(q = 60, size = 85, prob = 0.6)
pnorm(q = 15, mean = 12, sd = 3, lower.tail = FALSE)
pbinom(q = 59, size = 85, prob = 0.6) * pnorm(q = 15, mean = 12, sd = 3, lower.tail = FALSE)  

par(mfrow= c(2,1))

x = seq(from = -3, to = 3, length = 200)
plot(x, dnorm(x), type = "l")
lines(x, dt(x, df = 16), col = 2)
lines(x, dt(x, df = 8), col = 3)
lines(x, dt(x, df = 4), col = 4)

# In determining which distribution is appropriate for a set of data, a plot comparing the empirical density with the theoretical density is useful
hist(Auto$New_Name_MPG, breaks = seq(0, 60, length = 20), probability = TRUE)
lines(x, dnorm(x, mean = mean(Auto$New_Name_MPG), sd = sd(Auto$New_Name_MPG)), col = 2)

# Sampling
poissamp = rpois(n = 400, lambda = 2)
hist(poissamp, breaks = 0:10, probability = TRUE)
normsamp = rnorm(n = 250, mean = 10, sd = 5)
hist(normsamp, breaks=seq(-10,30,length=15), probability = TRUE)
x = seq(-10,30,length=200)
lines(x, dnorm(x, mean = 10, sd = 5), col = 2)


set.seed(1)
rnorm(5)

nvec = 1:16
sample(nvec) # without replacement
sample(nvec, size = 3) # vector of length 3
sample(nvec, replace = TRUE) # with replacement
sample(nvec, size = 10, replace = TRUE)

# Plotting
# Loading Data
fileName = "Auto.data"
defaultDataDir = "/Users/majalie/Documents/LSEPKU"
fileLocation = file.path(defaultDataDir, fileName)
Auto = read.table(file = fileLocation)
View(Auto)
Auto = read.table(file = fileLocation, header = T, na.strings = "?")

fileName = "Auto.csv"
fileLocation = file.path(defaultDataDir, fileName)
Auto = read.csv(file = fileLocation, header = T, na.strings = "?")
dim(Auto)
Auto = na.omit(Auto)
dim(Auto)
names(Auto)
names(Auto)[1] = "New_Name_MPG"
names(Auto)

summary(Auto)

# Graphics and plots
plot(Auto$cylinders, Auto$New_Name_MPG, type = "p", pch = "x", col = "blue", xlab = "Cylinders", ylab = "MPG")
attach(Auto)
cylinders = as.factor(cylinders)
plot(cylinders, New_Name_MPG, col = "pink", varwidth = T, xlab = "Cylinders", ylab = "MPG")

# Boxplots
boxplot(New_Name_MPG, col = "orange", xlab = "MPG", ylab = "Value")
boxplot(acceleration, cylinders)

# Histograms
hist(New_Name_MPG, col = "red", breaks = 10)

#Scatterplot Matrix
pairs(Auto)
pairs(~New_Name_MPG + displacement + horsepower + weight +
        acceleration, data = Auto)

qqnorm(New_Name_MPG, ylab = "MPG Quantiles"); qqline(New_Name_MPG, col = "blue", lwd = 2)

# 3D Plot
x = seq(from=-2, to=2, length=50)
y = seq(from=-1, to=1, length=50)
par(mfrow=c(1,2))
z = outer(x^2,y^3)
contour(x, y, z)
persp(x, y, z, theta = -50, phi =20)

# Sampling
poissamp = rpois(n = 400, lambda = 2)
hist(poissamp, breaks = 0:10, probability = TRUE)
normsamp = rnorm(n = 250, mean = 10, sd = 5)
hist(normsamp, breaks=seq(-10,30,length=15), probability = TRUE)
x = seq(-10,30,length=200)
lines(x, dnorm(x, mean = 10, sd = 5), col = 2)


set.seed(1)
rnorm(5)

nvec = 1:16
sample(nvec) # without replacement
sample(nvec, size = 3) # vector of length 3
sample(nvec, replace = TRUE) # with replacement
sample(nvec, size = 10, replace = TRUE)

# Simulation Experiments
# We are defining a function to get the sample mean
poisSampleMean = function(n, lambda, r){
  simvals = rpois(n*r, lambda)
  simvals = matrix(simvals, n, r)
  colMeans(simvals)
}
set.seed(1)
poisSampleMean(10,3,6) # these are our calculated sample means from 6 simulated samples

histNorm = function(data, nbins = 21){
  hist(data, breaks = seq(min(data), max(data), length=nbins), probability = TRUE, col = 5)
  x = seq(min(data), max(data), length = 200)
  lines(x, dnorm(x), mean = mean(data), sd = sd(data), col = 2)
}

histNorm(poisSampleMean(8, 1, 1000))

# Writing your own functions
fn = function(arg1){
  if(arg1 <= 0){
    100}
  else{
    2 + fn(arg1 - 1)}
}

m = fn(5)
m
fn(-5)

binomplot = function(size, prob = 0.5, colour = 3, outputvals = FALSE){
  x = 0:size
  y = dbinom(x, size, prob)
  plot(x, y, type = "h", col = colour)
  if(outputvals) y
}

binomplot(50)
binomplot(55, outputvals = TRUE, colour = 1) # specify non default values: output values T, colour gray


View(PlantGrowth)
control = PlantGrowth$weight[1:10]
control
treatment1 = PlantGrowth$weight[11:20]
treatment2 = PlantGrowth$weight[21:30]
boxplot(control, treatment1, treatment2)
