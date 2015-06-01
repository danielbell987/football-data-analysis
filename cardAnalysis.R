#####################################################################################
## This script subsets data for red & yellow cards for each season and then        ##
## performs analysis.                                                              ##
#####################################################################################

library(ggplot2)

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


ggplot(data=cardData, aes(x=Year, y=TotalYellow, group=Div, shape=Div, colour=Div)) + 
  geom_line(aes(linetype=Div), size=1) +
  geom_point(size=3, fill="white") +
  scale_colour_hue(name="Division", l=30)  +                  
  scale_shape_manual(name="Division", values=c(22,21,23,24)) +
  scale_linetype_discrete(name="Division") +
  xlab("Year") + ylab("Total Yellow Cards Given") +
  ggtitle("Total number of yellow cards given in each season") +
  theme_bw() +
  theme(legend.position=c(.90, .90))
