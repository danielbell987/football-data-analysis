#####################################################################################
## This script is used to download football result data from football-data.co.uk,  ##
## including the top 4 English leagues from 93/94 - 14/15.                         ##
#####################################################################################

library(lubridate)
library(data.table)

getData <- function(){
  getUrls <- function(years, leagues){
    urls <- NULL
    for(year in years){
      for(league in leagues){
        url <- paste("http://www.football-data.co.uk/mmz4281/", year, "/", league, ".csv", sep = "")
        urls <- c(urls, url)
      }
    }
    urls
  }

  years <- c("1415", "1314", "1213", "1112", "1011", "0910", "0809", "0708", "0607", "0506", "0405", "0304", "0203", "0102", "0001", "9900", "9899", "9798", "9697", "9596", "9495", "9394")
  leagues <- c("E0", "E1", "E2", "E3")
  urls <- getUrls(years, leagues)
  
  data <- lapply(urls, read.csv, header = TRUE)
}

data <- getData()