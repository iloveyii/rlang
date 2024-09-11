library(rethinking)
data(Howell1)
d <- Howell1
d3 <- d[ d$age < 18 , ] # only <18 yrs old
str(d3)

xbar <- mean( d3$weight )
m <- quap(
alist(
height ~ dnorm( mu , sigma ) ,
mu <- a + b*( weight - xbar ) ,
a ~ dnorm( 178 , 20 ),
b ~ dnorm( 0 , 10 ) ,
sigma ~ dunif( 0 , 50 )
) , data=d3 )
precis(m)

post <- extract.samples( m )
w.seq <- seq(from=1,to=45,length.out=50)
mu <- sapply( w.seq , function(z) mean( post$a + post$b*(z-xbar) ) )
mu.ci <- sapply( w.seq , function(z)
PI( post$a + post$b*(z-xbar) , prob=0.89 ) )
pred.ci <- sapply( w.seq , function(z)
PI( rnorm( 10000 , post$a + post$b*(z-xbar) , post$sigma) , 0.89 ) )


# Clear Console -> CTRL + L

# Use this before the plot function
# jpeg(file="exercise2_2.jpeg")
png(file="exercise2_2.png",
width=600, height=350)

plot( height ~ weight , data=d3 ,
col=col.alpha("slateblue",0.5) , cex=0.5 )
lines( w.seq , mu )
lines( w.seq , mu.ci[1,] , lty=2 )
lines( w.seq , mu.ci[2,] , lty=2 )
lines( w.seq , pred.ci[1,] , lty=2 )
lines( w.seq , pred.ci[2,] , lty=2 )

dev.off()