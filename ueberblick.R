library("MASS")
library("ggplot2")
library(forcats)
  
par(mfrow = c(1,1))
par(mfrow = c(1,2))
data <- data.frame(survey, stringsAsFactors = FALSE)
data$Sex <- fct_recode(data$Sex, "Männlich" = "Male", "Weiblich" = "Female")

# Häufigkeitstabellen formatiert für ggplot
counts <- table(data$Sex, useNA = "always")
barplot_data <- data.frame(Sex = names(counts), Count = as.vector(counts))

ggplot(barplot_data, aes(x = Sex, y = Count, fill = Sex)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Count), vjust = -0.5, color = "black", size = 4) +
  scale_fill_manual(values = c("Männlich" = "blue3", "Weiblich" = "dodgerblue", "NA" = "grey")) +
  labs(fill = "Geschlecht", x = "", y = "Absolute Häufigkeit") +
  theme_minimal()
