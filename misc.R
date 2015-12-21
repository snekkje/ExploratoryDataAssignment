#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

x <- c(1999, 2002, 2005, 2008)
y <- c()

for (i in x){
  temp <- filter(NEI, year == i)
  y <- c(y,sum(temp$Emissions))
}