# Compute entire dataset
wheater = read.csv("data/clima_cg_jp-semanal.csv",
                   stringsAsFactors = FALSE)

# Campina Grande dataset
cg_wheater = wheater[wheater$cidade == "Campina Grande", ]

# Joao Pessoa dataset
jp_wheater = wheater[wheater$cidade == "João Pessoa", ]

# Take the mean of the tmedia in each city
mean_cg = mean(cg_wheater$chuva, na.rm = TRUE)
mean_jp = mean(jp_wheater$chuva, na.rm = TRUE)

# Create the file of the image
png(file = "bar_rain.png")

# Generate the vectors that will be used to plot the graph
mean_vector = c(mean_cg, mean_jp)
labels_bar = c("Campina Grande", "João Pessoa")

# Plot the graph
barplot(mean_vector, names.arg=labels_bar, xlab="City", ylab="Mean rain",
        col="blue", main="Mean rain", border="red")

dev.off()