library("MASS")
library(ggplot2)

# Spalten umbennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
survey$smoke_freq <- factor(survey$smoke_freq, ordered = TRUE, levels = c("Never", "Occas", "Regul", "Heavy"))
survey$exercise_freq <- factor(survey$exercise_freq, ordered = TRUE, levels = c("None", "Some", "Freq"))
unit <- survey[c(11,10)]
unit <- na.omit(unit)

# Grafik erstellen (Alternativ mit pulse 7)
ggplot(unit, aes(x = height, fill = unit)) +
  geom_density(alpha = 0.5) +
  labs(
    title = "Verteilung der Alterseinheiten",
    x = "Alter",
    y = "Dichte",
    fill = "Einheit"
  ) +
  theme_minimal()

