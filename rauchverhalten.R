library("MASS")
data <- data.frame(survey)
colnames(data) <- c(
  "sex",
  "wr_span",
  "nwr_span", 
  "wr_hand",
  "fold_top",
  "pulse",
  "clap_top",
  "exercise_freq",
  "smoke_freq",
  "height",
  "unit",
  "age")
# Überblick schaffen über die Daten

# Dataframe erstellen, die die Häufigkeit jedes Rauchverhaltens für Männer und Frauen zählt
smoke_counts <- as.data.frame.matrix(table(data$sex, data$smoke))

# Hinzufügen einer Spalte für das Geschlecht
smoke_counts$sex <- rownames(smoke_counts)
rownames(smoke_counts) <- NULL

# Umstrukturierung der Daten für ggplot2
library(tidyr)
smoke_counts_long <- pivot_longer(smoke_counts, cols = c("Never", "Occas", "Regul", "Heavy"), names_to = "smoke_type", values_to = "count")

# Nach leveln sortieren
smoke_counts_long$smoke_type <- factor(smoke_counts_long$smoke_type, levels = c("Never", "Occas", "Regul", "Heavy"))
levels(smoke_counts_long$smoke_type) <- c("Niemals", "Gelegentlich", "Regelmäßig", "Viel")
smoke_counts_long$sex <- ifelse(smoke_counts_long$sex == "Male", "Männlich", "Weiblich")

percentages <- smoke_counts_long %>%
  group_by(sex) %>%
  mutate(percentage = count / sum(count) * 100)

# Erstellen des Balkendiagramms
library(ggplot2)
ggplot(smoke_counts_long, aes(x = smoke_type, y = count, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme_minimal() +
  ggtitle("Rauchgewohnheiten nach Geschlecht") +
  labs(x = "Rauchertyp", y = "Anzahl", fill = "Geschlecht") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(smoke_counts_long, aes(x = smoke_type, y = count, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = paste0(round(count/sum(count)*100), "%"), y = count), 
            position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  theme_minimal() +
  ggtitle("Rauchgewohnheiten nach Geschlecht aufgeteilt") +
  labs(x = "Rauchertyp", y = "Anzahl", fill = "Geschlecht") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(percentages, aes(x = smoke_type, y = count, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = sprintf("%.2f%%", percentage), y = count), 
            position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  theme_minimal() +
  ggtitle("Rauchgewohnheiten nach Geschlecht aufgeteilt") +
  labs(x = "Rauchertyp", y = "Anzahl", fill = "Geschlecht") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
