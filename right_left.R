library("MASS")
library(ggplot2)

# Spalten umbennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");

### Hands
hands <- survey[,c(2,3)]
hands <- na.omit(hands)

# Lineare Regression
lm(survey$nwr_span ~ survey$wr_span)

ggplot(hands, aes(x = wr_span, y = nwr_span)) +
  geom_point(color = "dodgerblue") +  # Punkte hinzufügen
  geom_smooth(method = "lm", se = FALSE, color = "black") +  # Regressionslinie ohne Standardfehler hinzufügen
  labs(x = "Spannweite der Schreibhand", y = "Spannweite der anderen Hand") + # Achsenbeschriftungen
  theme_minimal()
  
ggplot(hands, aes(x = wr_span)) +
  geom_density(fill = "blue3", alpha = 0.5) +
  geom_density(aes(x = nwr_span), fill = "dodgerblue", alpha = 0.5) +
  labs(x = "Spannweite",
       y = "relative Häufigkeit") +
  xlim(10, 25) +
  theme_minimal()

