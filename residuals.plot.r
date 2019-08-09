residuals.plot <- function(observed = NULL, predicted = NULL, title = "Residuals plot"){
  library(ggplot2)
  residuals <- observed - predicted
  df <- as.data.frame(cbind(residuals = residuals,observed = observed, col = abs(residuals)))
  ggplot(df, aes(x = observed, y = residuals,color=col)) +
    geom_point(size = 2, shape = 15) +
    geom_hline(yintercept = 0) +
    labs(title = title,
       x = "observed values", y = "model residuals") +
    theme(legend.justification = c(0, 1), legend.position = c(0, 1),
          axis.text = element_text(size = 22), axis.title=element_text(size=20),
          plot.title = element_text(size=24,face="bold",hjust = 0.5))
}