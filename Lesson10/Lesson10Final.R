# Load in libraries

install.packages("Ecdat")
library(Ecdat)
head(Cigarette)
View(Cigarette)

library("ggplot2")
library("dplyr")

ggplot(Cigarette, aes(x= state, y= packpc)) +geom_boxplot()

Cigarette %>% group_by(state) %>% summarise(Mean = mean(packpc)) %>% arrange((Mean))
Cigarette %>% group_by(state) %>% summarise(Mean = mean(packpc)) %>% arrange(desc(Mean))
#Utah has the lowest by 56.8 packpc and highest being Kentucky with 174 packspc

#Create a scatter plot of price per pack vs number of packs per capita for all states and years.

ggplot(Cigarette, aes(x= avgprs, y= packpc)) +geom_point() 
#negative correlation

#Change your scatter plot to show the points for each year in a different color.

ggplot(Cigarette, aes(x= avgprs, y= packpc, color=year)) +geom_point() +geom_smooth(method = lm)
cor.test(Cigarette$avgprs,Cigarette$packpc, method="pearson", use="complete.obvs")
#Does the relationship between the two variable change over time?
#yes, the price increases over time which may lead to the decrease in packs per capita. However there may have been other factors contributing.

#Do a linear regression for these two variables. How much variability does the line explain?
regression <-lm(packpc~avgprs, Cigarette)
summary(regression)
regression

#adjust for inflation by dividing avgprs by cpi variable, then redo plot and regression.

Inflation <- Cigarette %>% mutate(inflation = avgprs/cpi)

ggplot(Inflation, aes(x= inflation, y= packpc, color=year)) +geom_point() +geom_smooth(method = lm)

cor.test(Inflation$inflation,Inflation$packpc, method="pearson", use="complete.obvs")

regression2 <-lm(packpc~inflation, Inflation)
summary(regression2)

#create a data frame with just the rows from 1985.
dat1985 <- Cigarette %>% filter(year==1985)

#create a data frame with just the rows from 1995.
dat1995 <- Cigarette %>% filter(year==1995)

t.test(dat1985$packpc, dat1995$packpc, paired = TRUE)
#There is a significant difference between the two years.
