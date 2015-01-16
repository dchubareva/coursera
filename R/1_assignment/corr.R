corr <- function(directory, threshold = 0) {
  result <- vector(mode="numeric", length=0)
  for(i in 1:332) {
    filename <- paste(directory, sprintf("/%03d", i), ".csv", sep = "")
    d <- read.csv(filename, sep=",")
    notNa <- sum(!is.na(d$nitrate) & !is.na(d$sulfate))
    if(notNa>=threshold && notNa != 0) {
      result <- c(result, cor(d$nitrate, d$sulfate, use="complete.obs"))
    }
  }
  result
}