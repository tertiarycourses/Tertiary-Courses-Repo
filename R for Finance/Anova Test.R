data = read.csv("/Users/Downloads/crop.data 2.csv")
test = aov(yield ~ factor(fertilizer), data = data)
summary(test)
