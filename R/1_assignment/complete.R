complete <- function(directory, id = 1:332) {
  first = TRUE
  for(i in id) {
    filename <- paste(directory, sprintf("/%03d", i), ".csv", sep = "")
    d <- read.csv(filename, sep=",")
    notNa <- sum(!is.na(d$nitrate) & !is.na(d$sulfate))
    if(first) {all <- as.data.frame(matrix(c(i, notNa), nrow = 1, ncol = 2))}
    else {all <- rbind(all, c(i, notNa))} 
    first = FALSE
  }
  names(all) <- c("id", "nobs")
  all
}
