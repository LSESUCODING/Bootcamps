# Regression in R
# we use training data to calculate our estimators

par(mfrow=c(1,3))
getwd()
setwd("/Users/majalie/Documents/LSEPKU")
Advertising = read.csv("Advertising.csv")
plot(Advertising$TV, Advertising$Sales, col = "red")
abline(lm(formula = Sales~TV, data = Advertising), lwd = 3, col = "blue")
# plot TV vs Sales and add trend line

attach(Advertising) # always attach to make columns recognizable in R
plot(Radio, Sales, col = "red")
abline(lm(formula = Sales~Radio, data = Advertising), lwd = 3, col ="blue")
plot(Newspaper, Sales, col = "red")
abline(lm(formula = Sales~Newspaper, data = Advertising), lwd = 3, col="blue")

# Regression SS is a comparison between your model and simplest model
# Total SS = RegSS + ResidSS

# Note: more complex model means higher R^2
# Adjusted R^2 means adjusted for number of predictors in model

adSLR = lm(formula = Sales~TV)
adSLR # some basic information about the model
summary(adSLR) # detailed information
# Operators in formula: "+" means series of variables, "-" means remove a variable, ":" means interaction term only, "*" means main effect and interaction term

names(adSLR) # names of information stored in the linear model

# Multiple linear regression
multipleLR = lm(formula = Sales~TV+Radio+Newspaper, data = Advertising)
summary(multipleLR)
cor(Advertising[-1])

# Revise model since newspaper is not significant
multipleLR = lm(formula=Sales~TV+Radio, data = Advertising)
predict(multipleLR, data.frame(TV = c(100), Radio = c(20)), interval = "confidence") 
# fit is point prediction, confidence interval gives lower and upper limits
predict(multipleLR, data.frame(TV = c(100), Radio = c(20)), interval = "predict")


# Regressors can be replaced by known functions of them
nonLR = lm(formula = Sales~TV*Radio, data = Advertising)
coef(summary(nonLR))

detach()

# Polynomial regression: I() tells R to use the argument in the regression
# Polynomial regression: poly() takes arguments of relevant variable and degree of polynomial
Auto = read.csv("Auto.csv", na.strings = "?")
View(Auto)
Auto = na.omit(Auto)
dim(Auto)
attach(Auto)
polynomialLR = lm(formula = mpg~horsepower+I(horsepower^2), data = Auto)

coef(summary(polynomialLR))
plot(horsepower, mpg, col = "red")
lines(sort(horsepower), fitted(polynomialLR)[order(horsepower)], col = "blue", type="l", lwd = 3)

polyLR = lm(formula = mpg~poly(horsepower, 5), data = Auto)
lines(sort(horsepower), fitted(polyLR)[order(horsepower)], col = 6, type="l", lwd = 3)


# sort() default = ascending order, for vectors
# order() permutation rearranges arguments by index of original vector, i.e. ascending order of indices of values
set.seed(1)
a = sample(c(1:5))
a
sort(a) # ascending order
order(a) # 1 is the 5th entry of a so 5 becomes the first entry of order(a), 2 is the first entry of a so 1 becomes the second entry of order(a)

a[order(a)]

# Regression Tree - returns average of response in class instead of label, code similar to classification trees
library(MASS)
library(tree)
set.seed(1)
train = sample(1:nrow(Boston), nrow(Boston)/2)
tree.Boston = tree(medv~., Boston, subset = train)
summary(tree.Boston)

par(mfrow=c(1,1))
cv.Boston = cv.tree(tree.Boston)
plot(cv.Boston$size, cv.Boston$dev, type="b")
prune.Boston = prune.tree(tree.Boston, best = 5)
plot(prune.Boston)
text(prune.Boston, pretty=0)


# Predict on test set
yhat = predict(tree.Boston, newdata = Boston[-train,])
boston.test = Boston[-train, "medv"]
plot(yhat, boston.test)
abline(0,1)
mean((yhat-boston.test)^2)
