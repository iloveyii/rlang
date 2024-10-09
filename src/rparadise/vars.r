int <- 10
str(int)

n <- int + 2
print(n)

# rnorm(10, mean = 10, sd = 2)
# Standard deviation sigma : let pop is 2 4 4 4 5 5 7 9, then mew mean is 5
# variance is the square root of the average of the summation of deviations from mew and is 2
# set seed to get same vector
set.seed(10)
d <- rnorm(8, 5, 2)

# ls() is use to show the names of vars in memory
ls()
# show vars that contain m
ls(pat = "n")
# show vars starting from i
innerArea <- 23.5
print("starts from i")
ls(pat = "^i")
# show some info about vars in memory
ls.str()

# check type of var
print(typeof(n))
print(typeof(d))

str(d)
d