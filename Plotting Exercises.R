View(mtcars)
# Exercise 1
attach(mtcars)
plot(mpg, drat)

# Exercise 2
hist(gear, col = 'blue', xlab = "Number of Gears", ylab = "Frequency", main = "Histogram of Gears")

# Exercise 3
plot(mpg, drat, type = 'p', pch = "*", col = 'red', xlab = "MPG", ylab = "Rear Axle Ratio", main = "MPG vs. Rear Axle Ratio")

# Exercise 4
abline(lm(formula=drat~mpg, data = mtcars))

# Exercise 5
plot(mpg, drat, type = 'p', pch = "*", col = 'red', xlab = "MPG and Weight", ylab = "Rear Axle Ratio", main = "MPG and Weight vs. Rear Axle Ratio")
points(mpg, wt, type = 'p', col = 'blue')