#Linear regression with multiple quantitative variables
data = read.csv("/Users/angmingxuan/Downloads/Real estate.csv")
price = data$Y.house.price.of.unit.area
age = data$X2.house.age
distance = data$X3.distance.to.the.nearest.MRT.station
stores = data$X4.number.of.convenience.stores
M1 = lm(price ~ age + distance + stores)
summary(M1)
new = data.frame(age = 23, distance = 400, stores = 4)
predict(M1, new)

