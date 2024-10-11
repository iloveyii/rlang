# 3.4 Generating data
x <- 1:30
typeof(x)
mode(x)
x

# : has higher precedence
1:10-1

# seq can generate sequences of real numbers: from 1 to 5 with 0.5 inc, seq(from=1, to=5, length=9)
y <- seq(1, 5, 0.5)
y

# or hard coded
z <- c(2, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5)
z
# R
# zz <- scan()

# rep creates a vector with all same values
rep(1, 30)