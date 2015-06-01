#####################################################################################
## This script is used to clean the data from the loadData script. It is not       ##
## intended to merge the list of tables only make the columns easier to use.       ##
#####################################################################################

substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

cleanData <- function(){
  years <- NULL
  for (season in data){
    year <- as.character(season[1, "Date"])
    year <- substrRight(year, 2)
    year2 <- as.numeric(year) + 1
    if(year2 >= 0 & year2 <= 9){
      year2 <- paste("0", year2, sep = "")
      year <- paste(year, year2, sep = "")
    }
    else if(year2 == 100){
      year <- paste(year, "00", sep = "")
    }
    else {
      year <- paste(year, year2, sep = "")
    }
    years <- c(years, year)
  }
  
  i <- 1
  while(i < 89) {
    data[[i]]$Season <- years[[i]]
    i <- i + 1
  }
  data
}

data <- cleanData()
