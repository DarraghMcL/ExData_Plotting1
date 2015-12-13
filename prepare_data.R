#This script unzips the data file, extracts the relevant data, and then saves it as a csv for use with the other scripts

#point to the zipped file
zipped_file <- file.choose()
unzip(zipped_file)

#get the directroy of the files and set as working directroy
setwd(dirname(zipped_file))

#The unzipped file
data_file <- "household_power_consumption.txt"
dates_to_keep <- c("1/2/2007","2/2/2007")

#Reading the text file. Columns are seperated by semi-colons and a header is included.
full_data <- read.table(data_file, sep=";", header = TRUE)
sliced_data <- full_data[full_data$Date %in% dates_to_keep,]

#Write the data back out as a csv
write.csv(sliced_data, file = "./sliced_data.csv")
