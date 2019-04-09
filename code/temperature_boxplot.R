library(tidyverse)

# Compute entire dataset
wheater = read.csv("data/clima_cg_jp-semanal.csv",
                   stringsAsFactors = FALSE)

# Campina Grande dataset
cg_wheater = wheater[wheater$cidade == "Campina Grande", ]

# Joao Pessoa dataset
jp_wheater = wheater[wheater$cidade == "João Pessoa", ]

# Generate the variables that will be used to plot the graph
cg_box <- cg_wheater$tmedia
jp_box <- jp_wheater$tmedia

# Create the file of the image
png(file = "boxplot_wheater.png")

# Plot the graph
boxplot(cg_box, jp_box,
        main = "Weather Boxplot",
        names = c("Campina Grande", "João Pessoa"),
        col = c("orange","red"),
        border = "brown",
        horizontal = TRUE,
        notch = TRUE)

dev.off()