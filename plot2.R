# In order to reproduce this code you must download the "summarySCC_PM25.rds" data supplied 
# in the assignment. In addition the dplyr package must be included in your R repository.

library(dplyr)

# Reading in data
NEI <- readRDS("summarySCC_PM25.rds")

# Filtering data to include only the rows where "fips" is equal to 24510, the code
# for Baltimore City
Baltimore <- filter(NEI, fips == "24510")

# Summing Emission data from Baltimore with respect to year
agg <- aggregate(Baltimore$Emissions,list(year = Baltimore$year),sum)

# Plotting the aggregated data (agg) to represent how total emissions from PM2.5
# have changed over the years 1999-2008 in Baltimore City. This is labelled apppropriatly 
plot(agg$year,agg$x, xlab = "Year", ylab = "PM2.5 (tons)")
title(main = "PM2.5 from all sources in Baltimore City")

# Copying this plot to png.
dev.copy(png,'plot2.png')
dev.off()