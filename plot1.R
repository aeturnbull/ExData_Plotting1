## aeturnbull
## 12/24/2017
## Coursera - Exploratory Data Analysis - Course Project #1
## Code for creating Plot 1 - Histogram of Global Active Power


setwd("C:/")   ##set working direction to wherever you've saved the dataset on your computer

    Lines<-readLines("household_power_consumption.txt")  ## Read lines from the .txt file
    subL<-grep("^[12]/2/2007",  substr(Lines, 1,8))      ## Identify the lines corresponding to 2007-02-01 and 2007-02-02

    ## Read the data into a data frame called dta
    dta <- read.table(text=Lines[subL], header = TRUE, sep=";",  
        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))      

        table(dta$Date)  ## Double-checking that we only have the observations corresponding to the dates we want to analyze.  Checks out. 

    ## Changing the working directory to the local cloaned git repository 
    setwd("X:/Professional Development/Coursera/Exploratory Data Analysis/Course Project 1/ExData_Plotting1")
    
    ## Ok, Now creating the histgram in plot 1
    png("Plot1.png", width = 480, height = 480, units = "px")  #This ensures it's a png file of the correct domentions
    
    with(dta, hist(Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
    
    dev.off()
     