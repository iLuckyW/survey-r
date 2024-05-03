library(ggplot2)
library(dplyr)

# Spalten umbennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
survey$smoke_freq <- factor(survey$smoke_freq, ordered = TRUE, levels = c("Never", "Occas", "Regul", "Heavy"))
levels(survey$smoke_freq) <- c("Niemals", "Gelegentlich", "Regelmäßig", "Sehr viel")
survey$exercise_freq <- factor(survey$exercise_freq, ordered = TRUE, levels = c("None", "Some", "Freq"))
levels(survey$exercise_freq) <- c("Niemals", "Gelegentlich", "Häufig")

unit <- survey[c(8,9)]
unit <- na.omit(unit)

# Calculate the frequency counts
freq_counts <- unit %>% 
  group_by(smoke_freq, exercise_freq) %>% 
  summarise(count = n())

# Create the heatmap with count numbers
ggplot(freq_counts, aes(x = smoke_freq, y = exercise_freq)) +
  geom_tile(aes(fill = count), color = "white") +
  geom_text(aes(label = count), color = "white", size = 4) +
  scale_fill_gradient(low = "cyan3", high = "blue3") +
  labs(x = "Rauchverhalten",
       y = "Sportverhalten",
       fill = "Anzahl") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
