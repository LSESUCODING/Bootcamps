# R Tutorial 1

# Working Directory: used to access files on your computer
# Get your current working directory
getwd()

# Change your working directory
setwd("/Users/majalie/Desktop/LSESU CODESOC")

# Vectors: simplest type of data structure in R
# A sequence of data elements of the same type

v <- c(1, 2, 3) # assign vectors using <- and c() or = and c()
u <- c(3, 4 ,4)
v + u

v = v + 1
v

# You can perform basic calculations with vectors

# Recycling Rule: vectors of shorter length will be repeatedly added to longer vectors
small = c(1, 2)
big = c(0, 0, 0, 0)
small + big

# Sequences: used to iterate an operation over a series of numbers in for loops
1:10 # numbers 1 to 10
10:1 # numbers 10 to 1
2*1:10 # take the numbers from 1 to 10 and multiply each one by 2
1:10-3 # take the numbers from 1 to 10 and subtract 3 from each

seq(from=1, to=10, by=1) # start from 1, go to 10, and go by 1
seq(from=1, by=1, length=20) # start from 1, go by 1, and have 20 numbers
seq(1,10,1) # equivalent to seq(from=1, to=10, by=1) 
seq(1,10,2) # change step size to 2

# Data Frame: store data in table format
# Begin by creating vectors with data of equal length
weight = c(84.5, 72.6, 75.7, 94.8, 71.3, 82.3)
height = c(86.5, 71.8, 77.2, 84.9, 75.4, 81.9)

sheep = data.frame(weight, height) 
View(sheep)

mean(sheep$height) # calculate summary statistics of columns

sheep$backlength = c(130.4, 100.2, 109.4, 140.6, 101.4, 99.7) # add new columns

# If we don't use dataframename$columnname syntax, R doesn't recognize the variable name height so we will get an error for trying to remove it from memory
rm(height) # remove from memory
height
sheep$height

# To recognize column names without $ syntax, use attach()
# Attach the data frame
attach(sheep)
weight # now R knows that weight refers to the data frame
detach()
# Detach when you're done using the data frame

# Arrays: data objects that can store data in more than 2 dimensions
A = array(data = 1:16, dim = c(4,4)); A
A = array(data = 1:13, dim = c(4,4)); A # Recycling Rule applies

# Access individual elements or rows/columns from arrays using square brackets
A[1,2] # first row, second column element
A[1,] # entire first row

# Use indexing to remove data from an array by using "-" in front of the row or column we want to remove
B = A[-1, -1]; B

# Matrices: 2 dimensional data
# First argument is data, second argument is number of rows, third argument is number of columns
heightMatrix = matrix(sheep$height, 3, 2); heightMatrix

doubleheightMatrix = heightMatrix * 2; doubleheightMatrix # perform element wise calculations with matrices
matrix = matrix(data = 1:6, 2, 3)
matrix = matrix + 2; matrix

product = matrix %*% t(matrix) # Matrix multiplication is done by %*%
product
# Note: number of columns has to be equal to number of rows of matrices being multiplied

t(matrix) # transpose matrix: switch columns and rows
M = matrix(data = 1:4, 2, 2)
solve(M) # inverse of matrix M
M %*% solve(M) # should give you the identity matrix

# Add rows to matrix
newRow = c(5, 6); M = rbind(M, newRow); M

# Add columns to matrix
newCol = c(7, 8, 9); M = cbind(M, newCol); M

eigen(M) # returns eigenvalues and eigenvectors of matrix M

# We can create matrices with the array function as well and specifying the dimensions in the second argument
C = array( c(1,3,2,1), c(2,2))
d = array (c(1,0), c(2,1))

solve(C,d)
# solves the linear system Cx = d

# Clear memory of stored variables
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

# Conditional Statements: use curly brackets in syntax
num = as.integer(readline(prompt = "Enter a number: ")) # asks user for input number and converts to integer
if ((num %% 2) == 0) {
  print("Even")
} else {
  print("Odd")
}

# Ifelse statements in one line
x = seq(-5, 10, by = 1.5) # sequence starting from -5 to 10 by 1.5
y = ifelse(x < 0, "negative", "non-negative") # if x < 0 print negative, else print non negative
