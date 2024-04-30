library("MASS")
library(ggplot2)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
survey$exercise_freq <- factor(survey$exercise_freq, ordered = TRUE, levels = c("None", "Some", "Freq"))
levels(survey$exercise_freq) <- c("Niemals", "Gelegentlich", "Häufig")

survey$exercise_freq_rank <- rank(survey$exercise_freq)

# AV -> Pulse, UV -> Sport
lm <- lm(survey$pulse ~ survey$exercise_freq_rank)
plot(survey$exercise_freq_rank, survey$pulse)
abline(lm)