
# load full data set 
if(!exists('dataset')) {
  dataset <- read.csv(
    'household_power_consumption.txt',
    header = T,
    sep = ';',
    na.strings = '?'
  )
}

# filter dataset to 1st and 2d of Feb 2007
power <- dataset[dataset$Date == '1/2/2007' | dataset$Date == '2/2/2007',]

# define drawing function just once
drawChart <- function() {
  plot(
    power$Sub_metering_1,
    type='l',
    axes = F,
    ylab = 'Energy sub metering',
    xlab = ''
  )
  lines(
    power$Sub_metering_2,
    col = 'red'
  )
  lines(
    power$Sub_metering_3,
    col = 'blue'
  )
  axis(
    side = 1,
    at = c(0, 1440, 2880),
    labels = c('Thu','Fri','Sat')
  )
  axis(side = 2)
  box()
  legend(
    "topright",
    col = c("black", "blue", "red"),
    lty = 1,
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
}

# draw to file, reusing drawing function
drawToFile <- function(drawingFunction, fileName) {
  png(fileName)
  drawingFunction()
  dev.off()
}

drawChart()
drawToFile(drawChart, 'plot3.png')
