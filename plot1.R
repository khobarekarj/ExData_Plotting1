plot1 <- function()
{
	data1 <- read.table("data/household_power_consumption.txt", skip = 66637, nrow = 2880, 
                   sep = ";", na.strings="?", colClasses="character",
                   col.names = colnames(read.table("data/household_power_consumption.txt",
                   nrow = 1, header = TRUE, sep=";")))
	## convert any "?" to "NA"
	for( i in 1:9) 
	{
	  data1[data1[, i] == "?"] <- "NA"
	}

	## convert power measurements to numeric
	for(i in 3:9)
	{
	  data1[, i] <- as.numeric(data1[, i])
	}

	## convert Date and Time from factor to character 
	for( i in 1:2) 
	{
	  data1[, i] <- as.character(data1[, i])
	}

	hist(data1[,3],col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
	dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
	dev.off() 

	#print(head(data1))	

}