#First to copy the data from the repository: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##The file is compressed, then to descompress it I copied it in my working area.
## From this directory I have access for all the programs.




library(data.table)
dataEnergy<- read.table("./data/household_power_consumption.txt", header= TRUE,sep = ";", na.strings = "?" )
##Reading the discompressed file
head(dataEnergy,3) ##to know the columns' names 
class(dataEnergy[,1]) ##to know the class of the column 1
datos$Date <- as.character(datos$Date) ## To convert from factor to character
class(dataEnergy[,2]) ## to know the class of the column 2
datos$Time <- as.character(datos$Time) ## to convert from factor to character
str(dataEnergy) ## to see the changes in the class of the columns
datos1 <- dataEnergy[dataEnergy$Date == "1/2/2007",] ## to select the rows of the first date
datos2 <- dataEnergy[dataEnergy$Date == "2/2/2007",] ## to select the rows of the second date
datos3 <- rbind(datos1,datos2) ## to merge the rows
x <- paste(datos3$Date,datos3$Time)  ## Joint the date and the time
x <- as.POSIXlt(x, format = "%d/%m/%Y %H:%M:%S")  ## convert the character to class POSIXlt
plot(x,datos3[,3]) ## to see the plot
plot(x,datos3[,3], ylab = "Global Active Power (kilowatts)", col = "white") ## It prepares the lines
lines(x,datos3[,3])
dev.copy(png, file = "plot2.png", width = 480, height = 480) ## to create de graph in the device
dev.off() ## to close de device.
