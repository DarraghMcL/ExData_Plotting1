#Creating the first plot - A histogram of global active power

#Point to the csv file created in the prepare_data.R script
sliced_file <- file.choose()
sliced_data <- read.csv(sliced_file)

#Defining the label
x_label <- "Global Active Power (kilowatts)"
main_label <- "Global Active Power over time"

#Creating the plot
#Histogram of data in the global active power column. Default breaks.
png("plot_1.png", width=480, height=480)
hist(sliced_data$Global_active_power, col="red", main=main_label, xlab=x_label)
dev.off()