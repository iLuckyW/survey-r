# Laden des Datensatzes
library(MASS)
library(stats)

data(survey, package = "MASS")

# Histogramm der Höhendaten
hist(survey$Height, main = "", xlab = "Größe", ylab = "Häufigkeit", col = "dodgerblue", border = "black")

# TODO
mean_height <- mean(survey$Height, na.rm = TRUE)
sd_height <- sd(survey$Height, na.rm = TRUE)
