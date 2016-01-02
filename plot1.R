# In order to reproduce this code you must download the "summarySCC_PM25.rds" data supplied 
# in the assignment.

# Reading in data
NEI <- readRDS("summarySCC_PM25.rds")

# Summing Emission data with respect to year
agg <- aggregate(NEI$Emissions,list(year = NEI$year),sum)

# Plotting the aggregated data (agg) to represent how total emissions have changed in the
# US through the years 1999-2008. This is labelled apppropriatly
plot(agg$year,agg$x, xlab = "Year", ylab = "PM2.5 (tons)")
title(main = "PM2.5 from all sources in the US")

# Copying this plot to png.
dev.copy(png,'plot1.png')
dev.off()