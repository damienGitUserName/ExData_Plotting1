

plot2 <- function() {
  
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
  png('plot2.png')
  
  # plot
  plot(time_vector,power_data$Global_active_power,
       type="l",
       ylab ="Global Active Power (kilowatts)",
       xlab = "")
  
  # close the png file
  dev.off()
  

}