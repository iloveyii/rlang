# assign the 'Temp' column from the 'airquality' dataset to the 'Temperature' variable
Temperature <- airquality$Temp

# print the contents of the 'Temperature' variable
print(Temperature)

# save as jpeg
jpeg(file="saving_plot1.jpeg")
hist(Temperature, col="darkgreen")
dev.off()

# save as png
png(file="saving_plot2.png",
width=600, height=350)
hist(Temperature, col="gold")
dev.off()