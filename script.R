install.packages("data.table")
library(data.table)

years <- c("1415", "1314", "1213", "1112", "1011", "0910", "0809", "0708", "0607", "0506", "0405", "0304", "0203", "0102", "0001", "9900", "9899", "9798", "9697", "9596", "9495", "9394")
leagues <- c("E0", "E1", "E2", "E3")

urls <- NULL
for(year in years){
  for(league in leagues){
    url <- paste("http://www.football-data.co.uk/mmz4281/", year, "/", league, ".csv", sep = "")
    urls <- c(urls, url)
  }
}

data <- lapply(urls, read.csv, header = TRUE)

