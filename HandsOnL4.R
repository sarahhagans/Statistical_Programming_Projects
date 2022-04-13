library(datasets)
faithful
e.times <- faithful$eruptions
e.timesshort <-faithful$eruptions[faithful$eruptions <= 3.000]
e.timeslong  <-faithful$eruptions[faithful$eruptions >= 3.000]
#How many elements are in the vector short?
length(e.timesshort)
#97
#How many elements are in the vector long?
length(e.timeslong)
#175
#What is the mean erruption time of the short eruptions?
mean(e.timesshort)
#2.038134
#What is the mean erruption time of the long eruptions?
mean(e.timeslong)
#4.291303
#What is the standard deviation of the short eruption times?
sd(e.timesshort)
#0.2668655
#What is the standard deviation of the long eruption times?
sd(e.timeslong)
#0.4108516
  
  