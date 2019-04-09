library(tidyverse)

# Compute entire dataset
wheater = read.csv("data/clima_cg_jp-semanal.csv",
                   stringsAsFactors = FALSE)

# Campina Grande dataset
cg_wheater = wheater[wheater$cidade == "Campina Grande", ]

# Joao Pessoa dataset
jp_wheater = wheater[wheater$cidade == "João Pessoa", ]

# Generate the variables that will be used to plot the graph
cg_box <- cg_wheater$chuva
jp_box <- jp_wheater$chuva

# Create the file of the image
png(file = "boxplot_rain.png")

# Plot the graph
boxplot(cg_box, jp_box,
        main = "Rain Boxplot",
        names = c("Campina Grande", "João Pessoa"),
        col = c("blue","purple"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE)

dev.off()