#Linear regression with 1 quantitative variables and 1 categorical variable
data = read.csv("/Users/Downloads/CAR DETAILS FROM CAR DEKHO.csv")
sellingprice = data$selling_price
fuel = factor(data$fuel) #declare that the variable is measured by levels or categories
summary(fuel) #see the distribution of the categorical data, if there is a majority categories, we can group the other categories together
fuel = ifelse(fuel == "Diesel", "Diesel", "Others") #grouping the levels
M2 = lm(sellingprice~fuel)
summary(M2)

