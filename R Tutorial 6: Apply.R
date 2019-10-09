# Review from previous
View(mtcars)
plot(mtcars$mpg, mtcars$disp, pch = "+", col = "blue")
polynomial = lm(formula = mtcars$disp~mtcars$mpg+I(mtcars$mpg^2), data = mtcars)
lines(sort(mtcars$mpg), fitted(polynomial)[order(mtcars$mpg)])

# Apply family
X = matrix(rnorm(30), nrow = 5, ncol = 6)
apply(X, 2, sum) # sum the values of each column

# lapply()
A = matrix(rnorm(9), 3, 3)
B = matrix(rnorm(9), 3, 3)
C = matrix(rnorm(9), 3, 3)
myList = list(A, B, C)

# Extract the second column from myList with the selection operator [ and lapply()
lapply(myList, '[', , 2)
# Output appears as list

# Extract second row from myList
lapply(myList, '[', 2, )

# Extract the first element of the second row from each matrix
lapply(myList, '[', 1, 2)

# sapply()
sapply(myList, '[', 1, 2) # returns a vector

# rep() function
z = sapply(myList, '[', 1, 1) # initialize a vector z
z
z = rep(z, c(3, 1, 2)) # repeat the first value three times, the second value once, and the third value twice
z

# mapply() function
M = matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)), 4, 4)
M # above code repeats 1 four times, 2 four times, etc. 

# Now using mapply() we can create the same matrix
M2 = mapply(rep, 1:4, 4)
M2 # vectorize the action of rep

# Create standardized data
dataPoints = B
dataPoints_means = apply(dataPoints, 2, mean) # data points are in column vectors
dataPoints_std = apply(dataPoints, 2, sd)

# Center the points
dataPoints1 = sweep(dataPoints, 2, dataPoints_means, '-')
# take the elements of the columns of the dataset MyPoints and subtract the mean from each of them

# Normalize
dataPoints2 = sweep(dataPoints1, 2, dataPoints_std, '/')
dataPoints2

