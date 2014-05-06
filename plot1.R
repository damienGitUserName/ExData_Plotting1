

plot1 <- function() {
    
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
  
  # open a .png file 
  png('plot1.png')
  
  # plot 
  hist(power_data$Global_active_power , 
       xlab ="Global Active Power (kilowatts)",
       main = "Global Active Power",
       col = "red")
  
  # close the png file
  dev.off()
  
}