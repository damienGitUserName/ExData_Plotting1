


plot3 <- function() {
  
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
  png('plot3.png')
  
  # plot Sub_metering_1
  plot(time_vector,power_data$Sub_metering_1,
       type="l",
       ylab ="Energy sub metering",
       xlab = "")
  
  # plot Sub_metering_2
  lines(time_vector,power_data$Sub_metering_2,
       type="l",
       col="red")
  
  # plot Sub_metering_3
  lines(time_vector,power_data$Sub_metering_3,
       type="l",
       col="blue")
  
  # add the legend
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend 
         lty=c(1,1), # gives the legend appropriate symbols (lines)
         col=c("black", "red","blue")) # gives the legend lines the correct color
  
  # close the png file
  dev.off()
  
  
}