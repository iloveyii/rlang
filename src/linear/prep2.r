library(rethinking)

set.seed(2971)
N <- 100
a <- rnorm(N, 178, 20)
b <- rlnorm(N, 0, 1)

data(Howell1)
d2 <- Howell1


jpeg(file = "prep2.jpeg")

plot(NULL, xlim = range(d2$weight), ylim = c(-100, 400), xlab = "weight", ylab = "height") # nolint
abline(h = 0, lty = 2)
abline(h = 272, lty = 1, lwd = 0.5)
mtext("b ~ dnorm(0,10)")
xbar <- mean(d2$weight)
for (i in 1:N) {
  curve(a[i] + b[i] * (x - xbar), from = min(d2$weight), to = max(d2$weight), add = TRUE, col = col.alpha("black", 0.2)) # nolint
}

dev.flush()
dev.off()
