# In order to reproduce this code you must include the data.table and dplyr libaries to your R 
# repository as well as download the "household_power_consumption" data supplied in the assignment

library(ggplot2)
library(data.table)
library(dplyr)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#SCCSubset <- select(SCC, SCC, Short.Name)
#joinedDF <- left_join(NEI,SCCSubset, by = "SCC")

#motorVehicleBA <- filter(joinedDF, grepl("Vehicle", Short.Name) & fips == "24510")
#motorVehicleLA <- filter(joinedDF, grepl("Vehicle", Short.Name) & fips == "06037")

BAandLA <- rbind(motorVehicleBA,motorVehicleLA)
agg <- aggregate(BAandLA$Emissions,list(year = BAandLA$year, place = BAandLA$fips),sum)

print(qplot(year, x, data = agg, color = place) + ylab("PM2.5 emissions (tons)"))