# First plot it
# d2
# d2$height
# jpeg()
# plot(d2$height, d2$weight)
# # it works after a few tries

# plot(d2$height ~ d2$weight)
library(rethinking)

data(Howell1)
d2 <- Howell1
N <- 100

jpeg(file = "plot2.jpeg")

# plot.new() # nolint: commented_code_linter.
# Get data from R interactive shell
# Write data to file: write.table(d2, "d2.txt", append=FALSE, quote=FALSE, row.names = FALSE, col.names = FALSE)
# d2 <- read.table("data.txt")
plot(NULL, xlim = range(d2$weight), ylim = c(-100, 400), xlab = "weight", ylab = "height") # nolint
abline(h = 0, lty = 2)
abline(h = 272, lty = 1, lwd = 0.5)
mtext("b ~ dnorm(0,10)")
xbar <- mean(d2$weight)
for (i in 1:N) {
  curve(a[i] + b[i] * (x - xbar), from = min(d2$weight), to = max(d2$weight), add = TRUE, col = col.alpha("black", 0.2)) # nolint
}

dev.off()
