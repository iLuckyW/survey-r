# Lade das Paket ggplot2
library(ggplot2)
library("MASS")

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
summary(survey$age)

# Erstelle das Streudiagramm
ggplot(survey, aes(x = age, y = pulse)) +
  geom_point() +
  labs(x = "Alter", y = "Puls") +
  theme_minimal()

