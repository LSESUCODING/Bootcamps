# Exercise 1: from slides
dbinom(35, 80, 0.6)
1-pbinom(50, 80, 0.6)

# Exercise 2:
ppois(4, lambda = 5)
dpois(1, lambda = 5)

# Exercise 3:
samp = rnorm(300, mean = 12, sd = 3)
summary(samp)
sd(samp)
samp2 = rnorm(500, mean = 12, sd = 3)
summary(samp2)
sd(samp2)

# Exercise 4: 
# Step 1: set seed to 123 and sample 1000 times from a normal distribution with mean 10, sd 2
# Step 2: sample 1000 times from a t-distribution with 10 df
# Step 3: Conduct a 

set.seed(123)
samp1 = rnorm(1000, 10, 2)
samp2 = rt(1000, 10)
means_t_test = t.test(samp1, samp2)
means_t_test$p.value

# Exercise 5: what is the probability of rolling a score greater than 3, less than 5 times in 10 rolls?
pbinom(4, size = 10, prob = 0.5)

# Exercise 6: On average a person working at a call center serves 50 people per hour. What is the probability they serve at least 60 people in one hour? 
1 - ppois(59, lambda = 50, lower = TRUE)
