install.packages("dplyr")

library("MASS")
library(ggplot2)
library(tidyr)
library(dplyr)
data <- data.frame(survey)

# Dataframe erstellen, die die Häufigkeit jedes Rauchverhaltens für Männer und Frauen zählt
exercise_counts <- as.data.frame.matrix(table(data$Sex, data$Exer))

# Hinzufügen einer Spalte für das Geschlecht & Löschen der Zeilennamen
exercise_counts$sex <- rownames(exercise_counts)
rownames(exercise_counts) <- NULL

# Umstrukturierung der Daten für ggplot2 in long
exercise_counts_long <- pivot_longer(exercise_counts, cols = c("None", "Some", "Freq",) , names_to = "exercise_type", values_to = "count")

# Nach leveln sortieren
exercise_counts_long$exercise_type <- factor(exercise_counts_long$exercise_type, levels = c("None", "Some", "Freq"))
levels(exercise_counts_long$exercise_type) <- c("Garnicht", "Gelegentlich", "Häufig")
exercise_counts_long$sex <- ifelse(exercise_counts_long$sex == "Male", "Männlich", "Weiblich")

# Prozente für Rauchverhalten pro Geschlecht 
percentages <- exercise_counts_long %>% group_by(sex) %>%
  mutate(percentage = count / sum(count) * 100)

# Erstellen des Balkendiagramms
ggplot(percentages, aes(x = exercise_type, y = count, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = sprintf("%.2f%%", percentage), y = count), 
            position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
  theme_minimal() +
  ggtitle("Rauchgewohnheiten nach Geschlecht aufgeteilt") +
  labs(x = "Rauchertyp", y = "Anzahl", fill = "Geschlecht") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
