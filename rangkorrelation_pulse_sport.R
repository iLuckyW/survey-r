library("MASS")
library(ggplot2)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")
survey$exercise_freq <- factor(survey$exercise_freq, ordered = TRUE, levels = c("None", "Some", "Freq"))
levels(survey$exercise_freq) <- c("Niemals", "Gelegentlich", "Häufig")

survey <- survey[c(6,13)]
survey <- na.omit(survey)

# Sportverhalten Ranken
survey$exercise_freq_rank <- rank(survey$exercise_freq)

# AV -> Pulse, UV -> Sport
lm <- lm(survey$pulse ~ survey$exercise_freq_rank)

# Punktefarben definieren
colors <- c("Niemals" = "cyan3", "Gelegentlich" = "dodgerblue1", "Häufig" = "blue3")

# Dataframe erstellen
df <- data.frame(exercise_freq_rank = survey$exercise_freq_rank,
                 pulse = survey$pulse,
                 exercise_freq = survey$exercise_freq)

# Plot zeichnen
ggplot(df, aes(x = exercise_freq_rank, y = pulse, color = exercise_freq)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  scale_color_manual(values = colors) +
  labs(x = "Übungshäufigkeit Rang", y = "Puls", color = "Übungshäufigkeit") +
  theme_minimal() +
  theme(legend.position = "top")

correlation <- cor(survey$exercise_freq_rank, survey$pulse, method = "spearman")
