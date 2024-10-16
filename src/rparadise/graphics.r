# The last open device becomes the active graphical device on which all subsequent graphs are displayed. 
# The function dev.list() displays the list of open devices
# pdf()
# png()
# svg()
# dev.list()


x <- rnorm(10, 300, 20)
y <- rnorm(10, 3, 1)
# svg()
png()
layout(matrix(1:6, 3, 2))
layout.show(6)

plot(x, y)
x
y

par(bg="yellow")
pie(x)
dotchart(y)
barplot(x)

