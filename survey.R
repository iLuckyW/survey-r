library("MASS")
library(ggplot2)

?survey
View(survey)

colnames(survey) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
<<<<<<< HEAD
summary(survey$age)

survey$smoke_freq <- factor(survey$smoke_freq, ordered = TRUE, levels = c("Never", "Occas", "Regul", "Heavy"))
plot(survey$smoke_freq)

=======
female <- subset(survey, sex == 'Female')
male <- subset(survey, sex == 'Male')
