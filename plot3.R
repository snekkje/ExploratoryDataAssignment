# In order to reproduce this code you must include the data.table and dplyr libaries to your R 
# repository as well as download the "household_power_consumption" data supplied in the assignment

library(ggplot2)
library(data.table)
library(dplyr)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- filter(NEI, fips == "24510")

agg <- aggregate(Baltimore$Emissions,list(year = Baltimore$year, type = Baltimore$type),sum)

print(qplot(year, x, data = agg, facets = type ~.) + ylab("PM2.5 emissions (tons)"))