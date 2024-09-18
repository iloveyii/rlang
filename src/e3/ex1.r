library(rethinking)

# Entropy
H <- function(p) -sum(p*log(p))

# Find entropies among islands
IB <- list()
IB[[1]] <- c( 0.2 , 0.2 , 0.2 , 0.2 , 0.2 ) 
IB[[2]] <- c( 0.8 , 0.1 , 0.05 , 0.025 , 0.025 ) 
IB[[3]] <- c( 0.05 , 0.15 , 0.7 , 0.05 , 0.05 ) 
sapply( IB , H )

# Find KL Distribution
 DKL <- function(p,q) sum( p*(log(p)-log(q)) )

 # make a matrix and loop over rows and columns
Dm <- matrix(NA, nrow=3, ncol=3)
for (i in 1:3) for (j in 1:3)
    Dm[i,j] <- DKL(IB[[j]] , IB[[i]])
round(Dm, 2)