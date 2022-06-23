#Linear regression with 2 quantitative variables
data = read.csv("/Users/Downloads/Real estate.csv") #add own file path name
price = data$Y.house.price.of.unit.area #extract the dependent varaible
age = data$X2.house.age #extract the independent varaible
plot(age, price) #check if a linear model seems suitable 
model1 = lm(price~age)
summary(model1)
abline(model1, col = "red") #to plot the linear regression line
new = data.frame(age = 10) #create a dataframe input
predict(model1, new)
