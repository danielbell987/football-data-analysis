#####################################################################################
## This script subsets data for red & yellow cards for each season and then        ##
## performs analysis.                                                              ##
#####################################################################################

getCardData <- function(){
  
  df <- data.frame(Div=character(),
                   Year=character(),
                   TotalYellow=numeric(),
                   TotalRed=numeric(),
                   stringsAsFactors=FALSE)
  
  data2 <- data[1:60]
  
  for (season in data2){
    div <- as.character(season[1, "Div"])
    year <- as.character(season[1, "Season"])
    totalYellow <- sum(season["HY"], season["AY"])
    totalRed <- sum(season["HR"], season["AR"])
    df <- rbind(df, data.frame(Div = div, Year = year, TotalYellow = totalYellow, TotalRed = totalRed))
  }
  df
}

cardData <- getCardData()
