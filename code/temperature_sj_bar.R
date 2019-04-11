library(dplyr)

# Compute entire dataset
wheater = read.csv("data/clima_cg_jp-semanal.csv",
                   stringsAsFactors = FALSE)

# Campina Grande dataset
cg_wheater = wheater[wheater$cidade == "Campina Grande",]
cg_wheater_sj = cg_wheater[cg_wheater$mes == "6",]

ano_vector = unique(as.vector(cg_wheater_sj[,8]))

cg_wheather_sj_mean = cg_wheater_sj %>%
                        group_by(ano) %>%
                        summarise_at(vars(-tmedia), funs(mean(., na.rm=TRUE)))

cg_wheather_sj_mean
print(cg_wheather_sj_mean, n=22)

tmin_vector = unlist(cg_wheather_sj_mean[,5], use.names=FALSE)

min(tmin_vector)

#tmin_vector
#ano_vector

# Create the file of the image
png(file = "bar_rain_cg_sj.png")

# Plot the graph
barplot(tmin_vector, names.arg=ano_vector, xlab="Year", ylab="Mean temperature",
        col="red", main="Mean temperature", border="red")

dev.off()
