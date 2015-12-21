# In order to reproduce this code you must include the data.table and dplyr libaries to your R 
# repository as well as download the "household_power_consumption" data supplied in the assignment

library(data.table)
library(dplyr)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

x <- c(1999, 2002, 2005, 2008)
y <- c()

for (i in x){
  temp <- filter(NEI, year == i)
  y <- c(y,sum(temp$Emissions))
}

plot(x,y)