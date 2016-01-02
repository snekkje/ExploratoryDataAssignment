# In order to reproduce this code you must download the "summarySCC_PM25.rds" and 
# "Source_Classification_Code.rds" data supplied in the assignment. In addition the 
# ggplot2 and dplyr packages must be included in your R repository.

library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset the SCC dataframe so that only the "SCC" and "Short.Name" columns remain
SCCSubset <- select(SCC, SCC, Short.Name)
# Joining the NEI and SCCSubset dataframes, aligned by the SCC column
joinedDF <- left_join(NEI,SCCSubset, by = "SCC")

# Filtering the joinDF dataframe so that only the rows where a "Vehicle" is in
# Baltimore City (fips = 24510 and stored in motorVehiclesBA) or Los Angeles Couty
# (fips = 24510 and stored in motorVehiclesLA) remain
motorVehicleBA <- filter(joinedDF, grepl("Vehicle", Short.Name) & fips == "24510")
motorVehicleLA <- filter(joinedDF, grepl("Vehicle", Short.Name) & fips == "06037")

# Stacking the motorVehicleBA and motorVehicleLA dataframes
BAandLA <- rbind(motorVehicleBA,motorVehicleLA)

# Summing the emissions data from the BAandLA dataframe with respect to year and fips
# number
agg <- aggregate(BAandLA$Emissions,list(year = BAandLA$year, place = BAandLA$fips),sum)

# Replacing the fips numbers into a more readable form
agg$place[agg$place == "24510"] <- "Baltimore city"
agg$place[agg$place == "06037"] <- "Los Angeles County"

# Producing a ggplot that compares emissions from motor vehicle sources in Baltimore City
# and Los Angeles County
plot <- qplot(year, x, data = agg, color = place) + ylab("PM2.5 emissions (tons)") +
  ggtitle("Comparing PM2.5 emissions from motor vehicle sources") + geom_line()
ggsave(filename = "plot6.png")
