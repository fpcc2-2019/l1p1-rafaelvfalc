# Compute entire dataset
wheater = read.csv("data/clima_cg_jp-semanal.csv",
                   stringsAsFactors = FALSE)

# Campina Grande dataset
cg_wheater = wheater[wheater$cidade == "Campina Grande", ]

# Joao Pessoa dataset
jp_wheater = wheater[wheater$cidade == "João Pessoa", ]

# Generating vectors that will be used to plot the graph
rain_vector = as.vector(cg_wheater_sj[,6])

# Give the chart file a name.
png(file = "rain.png")

# Plot the bar chart.
plot(rain_vector,type = "o",col = "red", xlab = "Week", ylab = "Rain fall", 
     main = "Rain fall per week")

dev.off()