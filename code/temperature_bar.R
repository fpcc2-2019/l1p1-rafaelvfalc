# Compute entire dataset
wheater = read.csv("data/clima_cg_jp-semanal.csv",
                    stringsAsFactors = FALSE)

# Campina Grande dataset
cg_wheater = wheater[wheater$cidade == "Campina Grande", ]

# Joao Pessoa dataset
jp_wheater = wheater[wheater$cidade == "João Pessoa", ]

# Take the mean of the tmedia in each city
mean_cg = mean(cg_wheater$tmedia, na.rm = TRUE)
mean_jp = mean(jp_wheater$tmedia[jp_wheater$ano >= 1992], na.rm = TRUE)

mean_cg

mean_jp

# Create the file of the image
png(file = "bar_wheater.png")

# Generate the vectors that will be used to plot the graph
mean_vector = c(mean_cg, mean_jp)
labels_bar = c("Campina Grande", "João Pessoa")

# Plot the graph
barplot(mean_vector, names.arg=labels_bar, xlab="City", ylab="Mean temperature",
        col="red", main="Mean temperature", border="red")

dev.off()