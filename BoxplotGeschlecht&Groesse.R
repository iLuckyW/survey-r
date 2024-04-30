library(ggplot2)
library(dplyr)
library(MASS)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age")

# Remove NA values
table <- survey[c(1, 10)]
table <- na.omit(table)

# Subset
female <- subset(table, sex == 'Female')
male <- subset(table, sex == 'Male')

summary(female)
summary(male)

# Rename levels
table$sex <- ifelse(table$sex == "Female", "Weiblich", "Männlich")

# Create the boxplot
ggplot(table, aes(x = sex, y = height, color = sex)) +
  geom_boxplot() +
  labs(x = "Geschlecht", y = "Größe") +
  theme_minimal() +
  scale_color_manual(values = c("Weiblich" = "cyan3", "Männlich" = "blue3"), guide = FALSE)
