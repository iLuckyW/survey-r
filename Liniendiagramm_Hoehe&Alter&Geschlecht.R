# Lade die benötigten Pakete
library(ggplot2)
library(dplyr)
library(MASS)

# Ändere die Spaltennamen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")

# Filtere die Daten für Personen unter 60 Jahren und entferne NA-Werte
filtered_data <- survey %>%
  filter(age < 60) %>%
  na.omit()

# Bestimme die Farbe für jeden Punkt basierend darauf, ob mehr Männer oder Frauen abgestimmt haben
gender_counts <- filtered_data %>%
  group_by(age, height, sex) %>%
  summarise(count = n()) %>%
  group_by(age, height) %>%
  mutate(color = ifelse(sum(count[sex == "Male"]) > sum(count[sex == "Female"]), "blue3", "cyan3"))

# Erstelle das Streudiagramm
ggplot(gender_counts, aes(x = age, y = height, color = color)) +
  geom_point() +
  labs(x = "Alter", y = "Größe", color = "Sex") +
  scale_color_identity(labels = c("Männlich", "Weiblich"), guide = guide_legend(title = "Sex")) + # Legend
  theme_minimal() +
  theme(legend.box.background = element_rect(color = "black", size = 0.2)) # Box around legend
