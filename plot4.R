# In order to reproduce this code you must download the "summarySCC_PM25.rds" and 
# "Source_Classification_Code.rds" data supplied in the assignment. In addition the 
# ggplot2 and dplyr packages must be included in your R repository.

library(ggplot2)
library(dplyr)

# Reading in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the SCC dataframe so that only the "SCC" and "Short.Name" columns remain
SCCSubset <- select(SCC, SCC, Short.Name)
# Joining the NEI and SCCSubset dataframes, aligned by the SCC column
joinedDF <- left_join(NEI,SCCSubset, by = "SCC")

# Filtering the joinedDF dataframe to include only rows where the phrases "Coal" and
# "Comb" (referring to combustion) appear
combustCoal <- filter(joinedDF, grepl("Coal",Short.Name) & grepl("Comb", Short.Name))

# Summing the emmisions data from the CombustCoal datarame with respect to year
agg <- aggregate(combustCoal$Emissions,list(year = combustCoal$year),sum)

# Producing a ggplot representing how coal combustion-related sources have changed
# over the years 1999-2008. This is saved to png
plot <- qplot(year, x, data = agg) + ylab("PM2.5 emissions (tons)") + geom_line() +
  ggtitle("PM2.5 emissions from coal combustion related sources in the US")
ggsave(filename = "plot4.png")
