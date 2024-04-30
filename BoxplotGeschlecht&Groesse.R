library(ggplot2)
library(dplyr)
library(MASS)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");

#N.A. rausfiltern
table <- filter(survey, survey$sex == "Male" | survey$sex == "Female")

# Erstelle das Streudiagramm
ggplot(table, aes(x = sex, y = height)) +
  geom_boxplot() +
  labs(x = "Geschlecht", y = "Größe") +
  theme_minimal()