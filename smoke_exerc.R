library("MASS")
data <- data.frame(survey);
colnames(data) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
data$smoke_freq <- factor(data$smoke_freq, ordered = TRUE, levels = c("Never", "Occas", "Regul", "Heavy"))
data$exercise_freq <- factor(data$exercise_freq, ordered = TRUE, levels = c("None", "Some", "Freq"))

data <- data %>%
  mutate(exercise_freq = recode(exercise_freq, "None" = "Nie", "Some" = "Gelegentlich", "Freq" = "Häufig"),
         smoke_freq = recode(smoke_freq, "Never" = "Niemals", "Occas" = "Gelegentlich", "Regul" = "Regelmäßig", "Heavy" = "Sehr viel"))

barplot(table(data$exercise_freq, data$smoke_freq), beside = TRUE, legend.text = TRUE, 
        col = c("blue3", "dodgerblue1", "cyan3"),
        main = "Sportlichkeit vs LiRauchverhalten",
        xlab = "Rauchgewohnheit", ylab = "Sportlichkeit")

