# Random sequences

# Gaussian normal
x <- rnorm(5, 0, 1)
x

# Exponential
y <- rexp(5, 1)
y

# Binomial - rbinom(n, size, prob)
b <- rbinom(5, 3, 0.3)
b

# Matrix
m <- matrix(data=5, nr=2, nc=2)
m

m <- matrix(data=1:6, nr=3, nc=2)
m

c1 <- m[,1]
c1

r1 <- m[1,]
r1

# Series to matrix
m <- 1:15
m 
dim(m) # NULL
dim(m) <- c(5, 3)
m

# Expressions saves cmds and it can be evaluated later
exp <- expression ( 2 +2 )
exp
eval(exp)

# Operators 
x <- 1:3
y <- 1:3
x == y

print("Sum:")
sum(x)

0.9 == (1.0 - 0.1) # true

0.9 == (1.1 - 0.2 ) # false
identical(0.9, 1.1 - 0.2) # false

all.equal(0.9, (1.1 - 0.2) ) # true


