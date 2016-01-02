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

# Filtering the joinDF dataframe so that only the rows where a "Vehicle" is in
# Baltimore City (fips = 24510) remain
motorVehicle <- filter(joinedDF, grepl("Vehicle", Short.Name) & fips == "24510")

# Summing the emissions data from the motorVehicle dataframe with respect to year
agg <- aggregate(motorVehicle$Emissions,list(year = motorVehicle$year),sum)

# producing a ggplot representing how emissions from motor vehicle sources have changed 
# from 1999-2008 in Baltimore City. This is saved to png
plot <- qplot(year, x, data = agg) + ylab("PM2.5 emissions (tons)") + geom_line() +
  ggtitle("PM2.5 emissions from motor vehicle sources in Baltimore city")
ggsave(filename = "plot5.png")
