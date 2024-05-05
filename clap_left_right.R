# Library laden
library("MASS")
library(ggplot2)

# Spalten umbenennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")
clap <- survey[c(4,7)]
clap <- clap[clap$clap_top != "Neither", ]
clap$clap_top <- droplevels(clap$clap_top)
clap <- na.omit(clap)

# Levels umbenennen
clap$wr_hand <- ifelse(clap$wr_hand == "Left", "Links", "Rechts")
clap$clap_top <- ifelse(clap$clap_top == "Left", "Links", "Rechts")

# Wahrscheinlichkeitswerte in Tabelle speichern
clap_summary <- table(clap$wr_hand, clap$clap_top)
clap_summary <- prop.table(clap_summary, margin = 1) * 100
clap_summary <- as.data.frame(clap_summary)
names(clap_summary) <- c("wr_hand", "clap_top", "percentage")

# Barplot erstellen
ggplot(clap_summary, aes(x = wr_hand, y = percentage, fill = clap_top)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  geom_text(aes(label = paste0(round(percentage, 1), "%")),
            position = position_dodge(width = 0.7), vjust = -0.5, size = 3) +
  labs(title = "Verhalten beim Klatschen",
       x = "Schreibhand",
       y = "Prozent",
       fill = "Klatschverhalten") +
  scale_fill_manual(values = c("Links" = "cyan3", "Rechts" = "blue3")) +  # Farben anpassen
  theme_minimal()
