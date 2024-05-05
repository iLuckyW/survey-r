# Library laden
library("MASS")
library(ggplot2)

# Spalten umbenennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")
fold <- survey[c(4,5)]
fold <- fold[fold$fold_top != "Neither", ]
fold$fold_top <- droplevels(fold$fold_top)
fold <- na.omit(fold)

# Levels umbenennen
fold$wr_hand <- ifelse(fold$wr_hand == "Left", "Links", "Rechts")
fold$fold_top <- ifelse(fold$fold_top == "L on R", "L auf R", "R auf L")

# Wahrscheinlichkeitswerte in Tabelle speichern
fold_summary <- table(fold$wr_hand, fold$fold_top)
fold_summary <- prop.table(fold_summary, margin = 1) * 100
fold_summary <- as.data.frame(fold_summary)
names(fold_summary) <- c("wr_hand", "fold_top", "percentage")

# Barplot erstellen
ggplot(fold_summary, aes(x = wr_hand, y = percentage, fill = fold_top)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.7) +
  geom_text(aes(label = paste0(round(percentage, 1), "%")),
            position = position_dodge(width = 0.7), vjust = -0.5, size = 3) +
  labs(title = "",
       x = "Schreibhand",
       y = "Prozent",
       fill = "Kreuzverhalten") +
  scale_fill_manual(values = c("L auf R" = "cyan3", "R auf L" = "blue3")) +  # Farben anpassen
  theme_minimal()

