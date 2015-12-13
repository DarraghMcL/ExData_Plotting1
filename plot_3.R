#Creating the third plot - Comparison of sub metering values

#Point to the csv file created in the prepare_data.R script
sliced_file <- file.choose()
sliced_data <- read.csv(sliced_file)

#Defining the labels
x_label <- "Day of Week"
y_label <- "Energy Sub-metering"
main_label <- "Comparison of sub-meter readings"
legend_labels <- c("sub-metering_1", "sub-metering_2", "sub-metering_3")
legend_colours <- c("black", "red", "blue")

#Merging the date and time
date_time_string <-paste(sliced_data$Date, sliced_data$Time, sep=" ")
date_time <- strptime(date_time_string, "%d/%m/%Y %H:%M:%S")

#Plotting the graph
png("plot_3.png", width=480, height=480)
plot(date_time, sliced_data$Sub_metering_1, type="l", col="black",main=main_label, xlab=x_label, ylab=y_label)
lines(date_time, sliced_data$Sub_metering_2, type="l", col="red")
lines(date_time, sliced_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend_labels, lty=1, lwd=2, col=legend_colours)
dev.off()