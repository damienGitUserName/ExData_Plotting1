

plot4 <- function() {
  
  # load the names of the comlumns for easier use
  column_names = read.table("../household_power_consumption.txt",  # where the data is on my machine 
                            nrow = 1, 
                            header = TRUE, 
                            sep=";")
  
  # load the data by selecting the appropriate rows
  power_data = read.table("../household_power_consumption.txt", 
                          sep = ";", 
                          col.names = colnames(column_names),
                          skip = 66637,
                          nrows = 2880)
  
  # build the time vector 
  time_vector  =  strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S") 
  
  # open a .png file 
  png('plot4.png')
  
  # make a 2 by 2 grid for plots
  par(mfrow=c(2,2))
  
  # plot graph 1
  plot(time_vector,power_data$Global_active_power,
       type="l",
       ylab ="Global Active Power",
       xlab = "")
  
  # plot graph 2
  plot(time_vector,power_data$Voltage,
       type="l",
       ylab ="Voltage",
       xlab = "datetime")
  
  # plot graph 3
  plot(time_vector,power_data$Sub_metering_1,
       type="l",
       ylab ="Energy sub metering",
       xlab = "")
  
  # add Sub_metering_2 to graph3
  lines(time_vector,power_data$Sub_metering_2,
        type="l",
        col="red")
  
  # add Sub_metering_3 to graph3
  lines(time_vector,power_data$Sub_metering_3,
        type="l",
        col="blue")
  
  # add legend to graph3
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
         lty=c(1,1), # gives the legend appropriate symbols (lines)
         col=c("black", "red","blue"),
         bty = "n") # gives the legend lines the correct color and width
  
  # plot graph 4
  plot(time_vector,power_data$Global_reactive_power,
       type="l",
       ylab ="Global_reactive_power",
       xlab = "datetime")
  
  # close the png file
  dev.off()
  
  
}