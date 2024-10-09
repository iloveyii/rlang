library( rethinking )

d <- read.csv ("https://torkar.github.io/data-RBS.csv")
str(d) # check format
# make to a list so we can add alpha below
d <- as.list(d)
str(d)
# add alpha values for Dirichlet
d$alpha <- c(2 ,2 ,2)

library(dagitty)
dag <- dagitty (" dag{
E <- L
E <- T -> L
E <- M -> L
}")
coordinates (dag) <- list( x=c(E=1,L=1,T=0,M=2) ,
y=c(E=0,L=-1,T=-1,M=-1) )
drawdag(dag)