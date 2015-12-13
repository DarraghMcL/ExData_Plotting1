#Creating the fourth plot - Comparison of four different plots

#Point to the csv file created in the prepare_data.R script
sliced_file <- file.choose()
sliced_data <- read.csv(sliced_file)

#Defining the labels
#Plot 1
x_label_1 <- "date_time"
y_label_1 <- "Global Active Power"
main_label_1 <- "Global active power over time"

#Plot 2
x_label_2 <- "date_time"
y_label_2 <- "Voltage"
main_label_2 <- "Voltage over time"

#Plot 3
x_label_3 <- "date_time"
y_label_3 <- "Energy Sub-metering"
legend_labels <- c("sub-metering_1", "sub-metering_2", "sub-metering_3")
legend_colours <- c("black", "red", "blue")
main_label_3 <- "Comparison of sub-meter readings"

#Plot 4
x_label_4 <- "date_time"
y_label_4 <- "Global Reactive Power"
main_label_4 <- "Global reactive power over time"


#Merging the date and time
date_time_string <-paste(sliced_data$Date, sliced_data$Time, sep=" ")
date_time <- strptime(date_time_string, "%d/%m/%Y %H:%M:%S")

#Creating the plot
png("plot_4.png", width=480, height=480)
#Creating a 2x2 graph layout
par(mfrow = c(2, 2))

#Plot 1 - Global active power over time
plot(date_time, sliced_data$Global_active_power,col="black", main=main_label_1, type="l", xlab=x_label_1, ylab=y_label_1)

#Plot 2 - Voltage over time
plot(date_time, sliced_data$Voltage, type="l",  main=main_label_2,xlab=x_label_2, ylab=y_label_2)

#Plot 3 - Comparison of sub-meter readings
plot(date_time, sliced_data$Sub_metering_1, type="l", col="black", main=main_label_3, xlab=x_label_3, ylab=y_label_3)
lines(date_time, sliced_data$Sub_metering_2, type="l", col="red")
lines(date_time, sliced_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend_labels, lty=1, lwd=2, col=legend_colours)

#Plot 4 - Global reactive power over time
plot(date_time, sliced_data$Global_reactive_power, type="l", main=main_label_4, xlab=x_label_4, ylab=y_label_4)

dev.off()