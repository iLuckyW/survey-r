library("MASS")
library(ggplot2)

# Spalten umbennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");

### Hands
hands <- survey[,c(2,3)]
hands <- na.omit(hands)

ggplot(hands, aes(x = wr_span, y = nwr_span)) +
  geom_point() +  # Punkte hinzufügen
  geom_smooth(method = "lm", se = FALSE) +  # Regressionslinie ohne Standardfehler hinzufügen
  labs(x = "Spannweite der Schreibhand", y = "Spannweite der anderen Hand") +  # Achsenbeschriftungen
  ggtitle("Zusammenhang zwischen Spannweite der Schreibhand und der anderen Hand")  # Titel hinzufügen

ggplot(hands, aes(x = wr_span)) +
  geom_density(fill = "blue", alpha = 0.5) +
  geom_density(aes(x = nwr_span), fill = "green", alpha = 0.5) +
  labs(title = "Density Plot of Writing Hand Span vs Non-Writing Hand Span",
       x = "Span",
       y = "Density") +
  scale_fill_manual(values = c("blue", "green"), name = "Hand",
                    labels = c("Writing Hand", "Non-Writing Hand"))

