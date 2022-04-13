head(mtcars)
library(dplyr)
#view mt cars
mtcars

library(ggplot2)
#make a box plot
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_boxplot(aes(group=cyl))

mtcars %>% group_by(cyl) %>% summarize(count = n())