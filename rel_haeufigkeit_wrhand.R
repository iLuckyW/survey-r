library("MASS")
library(ggplot2)

# Spalten umbennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
survey$wr_hand <- factor(survey$wr_hand, levels = c("Left", "Right"))
levels(survey$wr_hand) <- c("Links", "Rechts")

# relative Häufigkeit
hand_summary <- data.frame(prop.table(table(survey$wr_hand, useNA = "always")))

# Plot erstellen
custom_colors <- c("Rechts" = "dodgerblue", "Links" = "blue3")

ggplot(hand_summary, aes(x = Var1, y = Freq, fill = Var1)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(round(Freq*100, 1), "%")), vjust = -0.5) +
  labs(x = "",
       y = "Relative Häufigkeit",
       fill = "Schreibhand") +
  scale_fill_manual(values = custom_colors) +
  theme_minimal()

