# plot(d2$height ~ d2$weight)
library(rethinking)

data(Howell1)
d2 <- Howell1
N <- 100

jpeg(file = "prep.jpeg")

plot(d2$height ~ d2$weight)

dev.flush()
dev.off()
