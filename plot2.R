## aeturnbull
## 12/24/2017
## Coursera - Exploratory Data Analysis - Course Project #1
## Code for creating Plot 2 

setwd("C:/")   ##set working direction to wherever you've saved the dataset on your computer

  Lines<-readLines("household_power_consumption.txt")  ## Read lines from the .txt file
  subL<-grep("^[12]/2/2007",  substr(Lines, 1,8))      ## Identify the lines corresponding to 2007-02-01 and 2007-02-02

  ## Read the data into a data frame called dta
    dta <- read.table(text=Lines[subL], header = TRUE, sep=";",  
                  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))      

  ## Creating a new variable that combines date and time
    dta$datetime<-paste(as.character(dta$Date), as.character(dta$Time), sep=" ") ##Creating a new character variable that contains both date and time
    dta$datetime<-strptime(dta$datetime, format = '%d/%m/%Y %H:%M:%S')  #This var is now POSIXlt

  ## Changing the working directory to the local cloaned git repository 
    setwd("X:/Professional Development/Coursera/Exploratory Data Analysis/Course Project 1/ExData_Plotting1")
 
  ## Plot 2
    png("Plot2.png", width = 480, height = 480, units = "px")  #This ensures it's a png file of the correct domentions
    
    plot(dta$datetime, dta$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
    
    lines(dta$datetime, dta$Global_active_power)
    
    dev.off()

