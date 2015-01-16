pollutantmean <- function(directory, pollutant, id = 1:332) {
  first = TRUE
  for(i in id) {
    filename <- paste(directory, sprintf("/%03d", i), ".csv", sep = "")
    if (first == TRUE) {
      all <- read.csv(filename, sep=",")
    }
    else {
      all <- rbind(all, read.csv(filename, sep=","))
    }
    first = FALSE
  }
  
  mean(all[[pollutant]], na.rm = TRUE)
}
