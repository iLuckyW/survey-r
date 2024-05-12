library(ggplot)
library(MASS)

# Spalten umbenennen
colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")
survey$smoke_freq <- factor(survey$smoke_freq, levels = c("Heavy", "Regul", "Occas", "Never"),
                            labels = c("Sehr viel", "Regelmäßig", "Gelegentlich", "Niemals"))

# Kumulative Summe berechnen
cumulative_sum <- cumsum(table(survey$smoke_freq))

# Dataframe mit kumulativer Summe erstellen
cumulative_df <- data.frame(smoke_freq = names(cumulative_sum), cumsum = cumulative_sum)

# Plot erstellen
ggplot(cumulative_df, aes(x = reorder(smoke_freq, cumsum), y = cumsum)) +
  geom_bar(stat = "identity", fill = "dodgerblue") +
  geom_text(aes(label = cumsum), vjust = -0.5, color = "black", size = 3) + # Add labels for absolute values
  scale_y_continuous(labels = scales::comma) + # Add commas to y-axis labels for better readability
  labs(x = "Rauchfrequenz",
       y = "Kumulative Anzahl") + 
  theme_minimal()
