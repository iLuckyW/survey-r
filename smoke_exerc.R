library("MASS")
data <- data.frame(survey);
colnames(data) <- c("sex", "wr_span", "nwr_span", "wr_hand", "fold_top", "pulse", "clap_top", "exercise_freq", "smoke_freq", "height", "unit", "age");
data$smoke_freq <- factor(data$smoke_freq, ordered = TRUE, levels = c("Never", "Occas", "Regul", "Heavy"))
data$exercise_freq <- factor(data$exercise_freq, ordered = TRUE, levels = c("None", "Some", "Freq"))

barplot(table(data$exercise_freq, data$smoke_freq), beside = TRUE, legend.text = TRUE, 
        col = c("lightskyblue3", "cadetblue2", "steelblue2"),
        main = "Exercise Frequency vs Smoke Frequency",
        xlab = "Smoke Frequency", ylab = "Exercise")

