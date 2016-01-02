# In order to reproduce this code you must download the "summarySCC_PM25.rds" data supplied 
# in the assignment. In addition the ggplot2 and dplyr packages must be included in your R 
# repository.

library(ggplot2)
library(dplyr)

# Reading in data
NEI <- readRDS("summarySCC_PM25.rds")

# Filtering NEI dataframe to include only the rows where "fips" is equal to 24510, the code
# for Baltimore City
Baltimore <- filter(NEI, fips == "24510")

# Summing Emission data from Baltimore with respect to year and type of emission
agg <- aggregate(Baltimore$Emissions,list(year = Baltimore$year, type = Baltimore$type),sum)

# Producing a panel plot representing how emissions from four sources (point, nonpoint, onroad,
# nonroad) have changed from 1999 to 2008 in Baltimore City. This is saved to png
plot <- qplot(year, x, data = agg, facets = type ~.) + ylab("PM2.5 emissions (tons)") +
  geom_line() + ggtitle("PM2.5 emissions from four sources in Baltimore City")
ggsave(filename = "plot3.png")