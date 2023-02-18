argu <- commandArgs(trailingOnly = TRUE)

library(dplyr)
#initialize variables
filename <- ""
variable <- ""
output_position <- ""

#parse the command line arguments
for (i in seq(argu)) {
  if (argu[i] == '-f' || argu[i] == "--file"){
    filename <- argu[i+1]
    i <- i+1
  } else if (argu[i] == "-v" || argu[i] == "--variable" ) {
    variable <- argu[i+1]
    i <- i+1
  }  else if (argu[i] == "-o" || argu[i] == "--output") {
    output_position <- argu[i + 1]
    i <- i + 1
  } else if (argu[i] == "-h" || argu[i] == "--help") {
    #help page information
    cat("Usage: Rscript catapult_wearable.R [OPTIONS]\n\n")
    cat("Options:\n")
    cat("-f, --filename            The name of the input file with path.\n")
    cat("-v, --variable            The variable that you want the output file contains \n")
    cat("-o, --output              The output path that you want the data at \n")
    cat("-h, --help                Print this help message and exit.\n\n")
    cat("variables that can be used: \n")
    cat("Acceleration.forward, Acceleration.side, Acceleration.up,\n")
    cat("Rotation.roll, Rotation.pitch, Rotation.yaw,\n")
    cat("RawPlayerLoad, RawPlayerLoad2D, RawPlayerLoad1DFwd,\n")
    cat("RawPlayerLoad1DSide, RawPlayerLoad1DUp,\n")
    cat("SmoothedPlayerLoad,\n")
    cat("imuRotation.roll, imuRotation.pitch, imuRotation.yaw,\n")
    cat("imuAcceleration.forward, imuAcceleration.side, imuAcceleration.up,\n")
    stop(cat("imuOrientation.forward, imuOrientation.side, imuOrientation.up\n"))
  }else {
    paste("Invalid option:", argu, ", use -h to find correct inputs")
  } 
}

if (filename == "" & variable == "" & output_position == "" & argu[i] != "-h") {
  cat("Error: Both filename and variable are required.\n")
  stop(cat("Use the -h or --help option for more information.\n"))
}

#read table
cat("reading table... \n")
wear <- read.csv(filename, header = FALSE)
cat("finish reading!\n")
#tidy data
cat("tidy data... \n")
wear[c(-1,-2,-3),] -> wear
colnames(wear) <- wear[1,]
wear[-1,] -> wear
wear %>% 
  mutate(series = as.numeric(RelativeCS) + 1,
         time_stamp = as.numeric(AbsoluteCS)) %>% 
  select(series, time_stamp, all_of(variable)) -> wear
cat("finish tidy! \n")
#output the file as csv
cat("output the data... \n")
write.csv(x = wear, 
          file = paste(output_position, "/data.csv", sep = ""),
          row.names = FALSE)
cat("finish output!\n")






































# Su Xu