# Lade die benötigten Pakete
library(ggplot2)
library(dplyr)
library(MASS)

# Ändere die Spaltennamen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")

# Filtere die Daten für Personen unter 60 Jahren
filtered_data <- survey %>%
  filter(age < 60)

# Bestimme die Farbe für jeden Punkt basierend darauf, ob mehr Männer oder Frauen abgestimmt haben
gender_counts <- filtered_data %>%
  group_by(age, height, sex) %>%
  summarise(count = n()) %>%
  group_by(age, height) %>%
  mutate(color = ifelse(sum(count[sex == "Male"]) > sum(count[sex == "Female"]), "blue", "red"))

# Erstelle das Streudiagramm
ggplot(gender_counts, aes(x = age, y = height, color = color)) +
  geom_point() +
  labs(x = "Age", y = "Height", color = "Sex") +
  scale_color_identity() +
  theme_minimal()

