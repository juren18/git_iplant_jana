# ggplot learning code
# Jana U'Ren
# 22mar2015

# install packages on your machine
install.packages("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

#load packages into memory
library("ggplot2")
library("reshape2")
library("ggthemes")
library("plyr")

# show first lines of iris dataset
head(iris)
#assign iris dataset to iris variable
myiris <- iris
#assign sepal length by sepal width to myplot
myplot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))

#show what variables have been assigned to x and y
summary(myplot)

#plot myplot
myplot + geom_point()

#plot sepal length by width and color species differently
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point(aes(shape = Species),size = 3)



#this will randomly pull 1000 rows from the diamonds dataset into d2
d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
#this tells you the size of the dataset
dim(diamonds)

#make an oject called myplot2 which is assigning carat and price to axes, color points by gem color
myplot2 <- ggplot(data = d2, aes(x = carat, y = price))
myplot2 + geom_point(aes(color = color),size = 2)

#this also works
ggplot(data = d2, aes(x = carat, y = price)) + geom_point(aes(color = color),size = 2)


library(MASS)

#factor(race) forces "race" to be a categorical variable rather than continuous
ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()

#assign plot to variable myplot3 and then summarize it
myplot3 <- ggplot(birthwt, aes(factor(race), bwt)) + geom_boxplot()
summary(myplot3)

#plot sepal length by width and color all points red
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point(color = "red") + facet_grid(Species ~ .)

#plot sepal length by width and color species differently and put species in a different box with facet_grid
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point() + facet_grid(Species ~ .)

#plot sepal length by width and color species differently and put species in a different box with facet_grid
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + geom_point() + facet_grid(. ~ Species )

library(RColorBrewer)
display.brewer.all()

#this takes data in multiple columns and puts them all into one column in dataset called df
df <- melt(iris, id.vars = "Species")
#plot bar graph with each variable as a function of species, dodge puts them side by side instead of stacked
ggplot(df, aes(Species, value, fill = variable)) + geom_bar(stat = "identity", position = "dodge") + scale_fill_brewer(palette = "Set1")





