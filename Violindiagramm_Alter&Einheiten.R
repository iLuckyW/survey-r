# Bibliothek laden
library(MASS)
library(ggplot2)

# Daten laden
data(survey)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");


# Farben definieren
colors <- c("cyan3", "blue3", "dodgerblue1")  # Hier Farben nach Bedarf anpassen

# Violinplot erstellen
ggplot(survey, aes(x = unit, y = age, fill = unit)) +
  geom_violin(trim = FALSE) +  # Violinplot für die Verteilung der Altersgruppen nach Einheiten-Nutzung
  labs(title = "",
       x = "Einheiten-Nutzung",
       y = "Alter",
       fill = "Einheiten-Nutzung") +
  scale_fill_manual(values = setNames(colors, unique(survey$unit))) +  # Farben individuell für jede Kategorie anpassen
  theme_minimal()

