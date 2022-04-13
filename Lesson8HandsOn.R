mtcars

library("ggplot2")
ggplot(data=mtcars, aes(x = hp, y = qsec)) + geom_point() + geom_smooth(method='lm', se = TRUE)

regression <- lm(qsec~hp, mtcars)
summary(regression)

library("ggplot2")
ggplot(data=mtcars, aes(x = wt, y = qsec)) + geom_point() + geom_smooth(method='lm', se = TRUE)

regression2 <- lm(qsec~wt, mtcars)
summary(regression2)

