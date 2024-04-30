library("MASS")
library(ggplot2)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")
survey$exercise_freq <- factor(survey$exercise_freq, ordered = TRUE, levels = c("None", "Some", "Freq"))
levels(survey$exercise_freq) <- c("Niemals", "Gelegentlich", "Häufig")

survey$exercise_freq_rank <- rank(survey$exercise_freq)

# AV -> Pulse, UV -> Sport
lm <- lm(survey$pulse ~ survey$exercise_freq_rank)

# Punktefarben definieren
colors <- c("Niemals" = "cyan3", "Gelegentlich" = "dodgerblue1", "Häufig" = "blue3")

# Plot mit Farben für die Punkte und Legende
plot(survey$exercise_freq_rank, survey$pulse, col = colors[survey$exercise_freq], pch = 16, xlab = "Übungshäufigkeit Rang", ylab = "Puls")
abline(lm)
legend("topright", legend = levels(survey$exercise_freq), col = colors, pch = 16, title = "Übungshäufigkeit")