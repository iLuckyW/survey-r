# Load required library
library(ggplot2)
library(MASS)

# Calculate mean and standard deviation of height
clean_survey <- survey[is.finite(survey$Height), ]

# Calculate mean and standard deviation of height
mean_height <- mean(clean_survey$Height)
sd_height <- sd(clean_survey$Height)

# Plot histogram of heights with Gaussian curve overlay
ggplot(clean_survey, aes(x = Height)) +
  geom_histogram(aes(y=after_stat(density)), bins = 24, fill = "dodgerblue", color = "dodgerblue3") +
  stat_function(fun = dnorm, args = list(mean = mean_height, sd = sd_height), color = "gray20", size = 1) +
  xlim(mean_height - 35 ,mean_height + 35) +
  theme_minimal() +
  labs(x = "Größe", y = "Relative Häufigkeit")
