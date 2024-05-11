# Load required library
library(ggplot2)
library(MASS)

# Calculate mean and standard deviation of height
clean_survey <- survey[is.finite(survey$Height), ]

# Calculate mean and standard deviation of height
mean_height <- mean(clean_survey$Height)
sd_height <- sd(clean_survey$Height)

# Plot histogram of heights with Gaussian curve overlay
ggplot(survey, aes(x = Height)) +
  geom_histogram(aes(y=after_stat(density)), bins = 20, fill = "dodgerblue", color = "gray12") +
  stat_function(fun = dnorm, args = list(mean = mean_height, sd = sd_height), color = "black", size = 1) +
  theme_minimal() +
  labs(x = "Größe", y = "Relative Häufigkeit")
