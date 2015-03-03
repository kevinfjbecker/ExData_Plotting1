
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
  hist(
    power$Global_active_power,
    col = 'red',
    xlab = 'Global Active Power (kilowatts)',
    main = 'Gobal Active Power'
  )
}

# draw to file, reusing drawing function
drawToFile <- function(drawingFunction, fileName) {
  png(fileName)
  drawingFunction()
  dev.off()
}


drawChart()
drawToFile(drawChart, 'plot1.png')
