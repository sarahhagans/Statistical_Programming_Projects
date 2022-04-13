library(dplyr)
library(ggplot2)
library(gapminder) 
head(gapminder)
install.packages("tidyverse")
library(tidyverse)
# five countries of my choice
#Argentina, Bolivia, Chile, Dominican Republic, Ecuador

gapmindergdpc <- gapminder %>%filter(country %in% c("Argentina", "Bolivia", "Chile", "Dominican Republic", "Ecuador")) %>%select(country, year, lifeExp, gdpPercap)

#Which country of the five you chose has the lowest per capita GDP in 1952? In 2007?
#Dominican Republic had the lowest in 1952 and Bolivia had the lowest in 2007
ggplot(gapminder, aes(x = factor(year), y = pop)) + geom_boxplot()
ggplot(gapminder, aes(x = factor(year), y = pop)) + geom_boxplot() +scale_y_log10()
gapmindergdps <- gapminder %>%filter(country %in% c("Argentina", "Bolivia", "Chile", "Dominican Republic", "Ecuador")) %>%select(country, year, lifeExp, gdpPercap)
ggplot(gapmindergdpc, aes (x= factor(year), y=gdpPercap, color = country)) + geom_point() +ggtitle("GDP per Capita of Countries by year")

#Which has the highest per capita GDP in 1952? In 2007?
#Argentina in 1952 and Chile in 2007
#Create a line plot with year on the horizontal axis and lifeExp on the vertical axis for the five countries; give each country a different color line. 
ggplot(gapmindergdps, aes(x = year, y = lifeExp, color = country)) +geom_line() +geom_point() +ggtitle("Life Expectancy of Countries by Year")
#Describe the variations in life expectancy between the countries.
#The higher the GDP the higher the life expectancy.
#On the entire gapminder data frame, compute the median of lifeExp for each year. 

gm_medians <- gapminder %>% select(year, lifeExp)%>%group_by(year) %>% summarise(life_med = median(lifeExp)) 
gm_medians

medmerge <- merge(gm_medians, gapmindergdpc)
medmerge$abovemed <- medmerge$lifeExp >medmerge$life_med
end <- (medmerge %>%select(year, life_med, country, abovemed)) %>% spread(key=country, value= abovemed)
view(end)

#For what years is the life expectancy for your five countries above the median life expectancy for the entire gapminder data frame?