# R Tutorial 1 Exercises

# Exercise 1: get/change working directory and read a text file
getwd()
setwd("/Users/majalie/Desktop/LSESU CODESOC")
data = read.delim("Sample Data.txt")
View(data)

# Exercise 2: create a sequence and perform calculations with that sequence
x = 1:10
x = x^2; x
y = x - 25; y

# Exercise 3: create a dataframe and add columns
temperature <- c(8.2, 18, 14.6, 8.3, 11.4, 22.2, 24.1, 8)
wind <- c(6.7, 0.9, 1.3, 4, 1.8, 5.4, 3.1, 2.2)
dataframe = data.frame(temperature, wind)
View(dataframe)
dataframe$rain = c(0, 0, 0, 0.2, 0, 0, 0, 0)
View(dataframe)

# Exercise 4: change the temperature vector by subtracting four from each element and update the dataframe
temperature = temperature - 4
dataframe$temperature = temperature
View(dataframe)

# Exercise 5: create a long vector and shorter vector and observe the recycling rule in practice
vec1 = rep(0, 12)
vec2 = c(1, 2, 3)
summed = vec1 + vec2
summed
vec3 = rep(1, 4)
z = summed - vec3
z

# Exercise 6: arrays
array1 = array(1:6, c(2,3))
array1
array1[,2]
array1[,2] = c(5, 6)
array1

# Exercise 7: create a temperature matrix using the weather data from before and add rows to original matrix
temperatureMatrix = matrix(temperature, 2, 4)
vec1 = c(33, 24, 15, 8)
vec2 = c(1, 2, 4, 9)
newTemperatureMatrix = rbind(temperatureMatrix, vec1, vec2)
newTemperatureMatrix
dim(newTemperatureMatrix)

# Exercise 8: inverse matrices
inverse = solve(newTemperatureMatrix)
identity = inverse %*% newTemperatureMatrix
identity = round(identity, 1)
identity

# Exercise 9: solving linear systems
b = c(3.3, 6, 7.2, 18)
solve(newTemperatureMatrix, b)

# Exercise 10: solving linear systems again
solution = inverse %*% b
solution

# Exercise 11: create a program that returns the square root of a given integer and returns NA if number is negative
num = as.integer(readline(prompt = "Enter a number: "))
if (num >= 0) {
  root = num^(1/2)
  return(root)
} else {
  return("NA")
}

# Exercise 12: create a program that returns TRUE if the elements of an array x are strictly increasing
x = c(1, 3, 5)
ifelse( (x[1] < x[2] & x[1] < x[3] & x[2] < x[3]), TRUE)

# Exercise 13: create a program using a for loop that counts the number of even numbers in a vector
x = c(2, 5, 3, 6, 7, 12, 15)
count = 0
for (i in x) {
  if (i %% 2 == 0)
    count = count + 1
  print(count)
}

# Exercise 14: use a for loop to simulate a coin flip twenty times
n = 20
coin_outcomes = vector(length = n, mode = "integer") # create a vector of length n with integers as elements
for (i in 1:20) {
  coin_outcomes[i] = sample(c(0, 1), 1) # in position i of the vector, that element should be either a 0 or 1 (so sample from 0 or 1 just once)
}

coin_outcomes

# Exercise 15: use a while loop to check if your guess of a number is correct
x = 7
while (TRUE) {
  guess = as.integer(readline(prompt = "Enter a number: "))
  if (guess == x) {
    print("Correct")
    break
  }
  if (guess != x) {
    next
  }
}
