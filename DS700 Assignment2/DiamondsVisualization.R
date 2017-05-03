require(ggplot2)
data("diamonds")
#Histogram
ggplot(data = diamonds) + geom_histogram(aes(x = carat))
#Scatterplot with color
ggplot(data = diamonds, aes(x = carat,y = price)) + geom_point(aes(colour = color))
#BoxPlot of Carats
ggplot(data = diamonds, aes(y = carat, x = 1)) + geom_boxplot()
#ViolinPlot of Carats by Cut
ggplot(data = diamonds, aes(y = carat,x = cut)) + geom_violin()
#Overview of the dataset
head(diamonds)
summary(diamonds)
