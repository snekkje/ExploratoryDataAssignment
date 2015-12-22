# In order to reproduce this code you must include the data.table and dplyr libaries to your R 
# repository as well as download the "household_power_consumption" data supplied in the assignment

library(ggplot2)
library(data.table)
library(dplyr)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#SCCSubset <- select(SCC, SCC, Short.Name)
#joinedDF <- left_join(NEI,SCCSubset, by = "SCC")

combustCoal <- filter(combust, grepl("Coal",Short.Name) & grepl("Comb", Short.Name))

agg <- aggregate(combustCoal$Emissions,list(year = combustCoal$year),sum)
print(qplot(year, x, data = agg) + ylab("PM2.5 emissions (tons)"))
