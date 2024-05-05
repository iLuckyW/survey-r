# Bibliothek laden
library(MASS)
library(ggplot2)

# Daten laden
data(survey)

# Violinplot erstellen
ggplot(survey, aes(x = unit, y = age, fill = unit)) +
  geom_violin(trim = FALSE) +  # Violinplot für die Verteilung der Altersgruppen nach Einheiten-Nutzung
  labs(title = "",
       x = "Einheiten-Nutzung",
       y = "Alter",
       fill = "Einheiten-Nutzung") +
  theme_minimal()