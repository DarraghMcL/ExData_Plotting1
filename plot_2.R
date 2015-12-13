#Creating the second plot - A line plot of global active power against the date/time

#Point to the csv file created in the prepare_data.R script
sliced_file <- file.choose()
sliced_data <- read.csv(sliced_file)

#Defining the labels
x_label <- "Day of Week"
y_label <- "Global Active Power (kilowatts)"
main_label <- "Global Active Power by Date/Time"

#Merging the date and time
date_time_string <-paste(sliced_data$Date, sliced_data$Time, sep=" ")
date_time <- strptime(date_time_string, "%d/%m/%Y %H:%M:%S")

#Creating the plot
#Line plot of data in the global active power column. Default breaks.
png("plot_2.png", width=480, height=480)
plot(date_time, sliced_data$Global_active_power,col="black", main=main_label, type="l", xlab=x_label, ylab=y_label)
dev.off()