# Simulation Problems

# Simulation 1: Comparing two estimators for mean value
# Estimator 1 is the average/mean
# Estimator 2 is the sum of the largest two numbers and smallest two numbers divided by 4
# First, generate a sample by using normal distribution with mean 0 and variance 1. Then use boxplot to show the results including appropriate labels
# Try different sample sizes
# Repeat 200 times for this simulation

estimator1 = function(x) {
  est1 = sum(x)/length(x)
  return(est1)
}

estimator2 = function(x) {
  l = length(x)
  xprime = sort(x)
  est2 = sum(x0[c(1,2,l-1,l)])/4
  return(est2)
}

repetitions = 100
result = matrix(NA, nrows = repetitions, ncol = 2) # initialize matrix with no values
for (i in 1:100) {
  n = 10
  x = rnorm(n)
  result[i, 1] = est1(x)
  result[i, 2] = est2(x)
}

boxplot(result, xlab = "Estimators", ylab = "Estimated results", main = "Simulation Results")

# Simulaton 2: expected value
# There is a 50% chance that a couple has a daughter. Genders are mutually independent
# Each couple wants to have children up to the point where they have a daughter
# Calculate the expected value of the number of babies in a family and the expected number of girls in a family

n = 500
a_baby = 0
a_girl = 0
for (i in 1:n) {
  a_baby = a_baby + i*0.5^i
  a_girl = a_girl + 1*0.5^i
}

a_girl/a_baby # ratio of girls in the family is still 0.5

# Simulation 3: disease risks
# Store your data in a matrix
data = matrix(c(137, 9540, 1460, 15000), nrow = 2, byrow = TRUE)
colnames(data) = c("Disease", "Control") # Add column names for those who have the disease and those who don't
rownames(data) = c("Exposed", "Unexposed") # Add row names for exposed and unexposed groups
print(data)

# Relative risk of having the disease given exposure is the probability of having the disease for people who were exposed divided by the probability of having the disease for people unexposed
calcRelativeRisk = function(data, referencerow = 2) {
  numberOfRows = nrow(data)
  names = rownames(data)
  for (i in 1:numberOfRows) {
    rowName = names[i]
    DiseaseUnexposed = data[referencerow, 1]
    ControlUnexposed = data[referencerow, 2]
    if (i != referencerow) {
      DiseaseExposed = data[i, 1]
      ControlExposed = data[i, 2]
      totalExposed = DiseaseExposed + ControlExposed
      totalUnexposed = DiseaseUnexposed + ControlUnexposed 
      probDiseaseGivenExposed = DiseaseExposed/totalExposed
      probDiseaseGivenUnexposed = DiseaseUnexposed/totalUnexposed
      
      relativeRisk = probDiseaseGivenExposed/probDiseaseGivenUnexposed
      print("Relative risk = ", relativeRisk)
    }
  }
}
