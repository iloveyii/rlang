library(rethinking)

set.seed(2971)
N <- 100
a <- rnorm(N, 178, 20)
b <- rlnorm(N, 0, 1)

data(Howell1)
d2 <- Howell1
d2
