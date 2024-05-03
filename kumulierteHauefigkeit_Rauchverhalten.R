# Lade den Datensatz survey
data(survey)
View(survey)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")


survey$smoke_freq <- factor(survey$smoke_freq, levels = c("Never", "Occas", "Regul", "Heavy"))
levels(survey$smoke_freq) <- c("Niemals", "Gelegentlich", "Regelmäßig", "Sehr viel")

# Erstelle eine Tabelle der Rauchgewohnheiten und ihrer Häufigkeiten
smoke_freq_table <- table(survey$smoke_freq)

# Berechne die kumulierten Häufigkeiten
cumulative_counts <- cumsum(smoke_freq_table)

# Plotte das Balkendiagramm der kumulierten Häufigkeiten
barplot(cumulative_counts, 
        main = "Kumulierte Häufigkeit der Rauchgewohnheiten", 
        xlab = "Rauchgewohnheiten", 
        ylab = "Kumulierte Häufigkeit",
        col = "dodgerblue",
        ylim = c(0, max(cumulative_counts) * 1.1), # Anpassung der y-Achsenbegrenzung für eine bessere Visualisierung
        names.arg = names(smoke_freq_table))

text(x = barplot(cumulative_counts, plot = FALSE), y = cumulative_counts, labels = cumulative_counts, pos = 3, cex = 0.8, col = "black")
