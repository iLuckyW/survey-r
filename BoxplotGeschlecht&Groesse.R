# Lade das Paket ggplot2
library(ggplot2)
library("MASS")

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
summary(survey$age)

#N.A. rausfiltern
table<- filter(survey, sex == "Male" | sex == "Female")


# Erstelle das Streudiagramm
ggplot(table, aes(x = sex, y = height)) +
  geom_boxplot() +
  labs(x = "Geschlecht", y = "Größe") +
  theme_minimal()
#help