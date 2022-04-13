
rr = data.frame(rivers)

head(rr)

rivers <- ggplot(rr, aes(x = rivers))
rivers + geom_histogram (binwidth = 50)+ ggtitle("Histogram of Rivers of North America in Miles")

summary(rr)
summary(rr$rivers)

rivers <- ggplot(rr, aes(x = "", y = rivers))
rivers + geom_boxplot() + xlab("")

ggplot(rr, aes(sample = rivers)) + geom_qq()