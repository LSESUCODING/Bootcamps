# R Tutorial 3: Plotting
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
x = seq(from=-2, to=2, length=50) # generate x data
y = seq(from=-1, to=1, length=50) # generate y data
par(mfrow=c(1,2)) # display two plots next to each other
z = outer(x^2,y^3) # outer() takes the outerproduct of the two arguments
contour(x, y, z) # creates a contour plot
persp(x, y, z, theta = -50, phi =20) # creates a 3D plot
