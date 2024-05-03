library(MASS)
library(ggplot2)
library(tidyr)
library(dplyr)
data <- data.frame(survey)

# Dataframe erstellen, die die Häufigkeit jedes Rauchverhaltens für Männer und Frauen zählt
smoke_counts <- as.data.frame.matrix(table(data$sex, data$smoke_freq))

# Hinzufügen einer Spalte für das Geschlecht & Löschen der Zeilennamen
smoke_counts$sex <- rownames(smoke_counts)
rownames(smoke_counts) <- NULL

# Umstrukturierung der Daten für ggplot2 in long
smoke_counts_long <- pivot_longer(smoke_counts, cols = c("Never", "Occas", "Regul", "Heavy"), names_to = "smoke_type", values_to = "count")

# Nach leveln sortieren
smoke_counts_long$smoke_type <- factor(smoke_counts_long$smoke_type, levels = c("Never", "Occas", "Regul", "Heavy"))
levels(smoke_counts_long$smoke_type) <- c("Niemals", "Gelegentlich", "Regelmäßig", "Sehr viel")
smoke_counts_long$sex <- ifelse(smoke_counts_long$sex == "Male", "Männlich", "Weiblich")

# Prozente für Rauchverhalten pro Geschlecht 
percentages <- smoke_counts_long %>% group_by(sex) %>%
  mutate(percentage = count / sum(count) * 100)

# Erstellen des Balkendiagramms
ggplot(percentages, aes(x = smoke_type, y = count, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = sprintf("%.2f%%", percentage), y = count), 
            position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  theme_minimal() +
  labs(x = "Rauchertyp", y = "Anzahl", fill = "Geschlecht") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  scale_fill_manual(values = c("Männlich" = "dodgerblue1", "Weiblich" = "cyan3"))