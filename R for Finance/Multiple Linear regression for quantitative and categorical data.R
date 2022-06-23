#Multiple Linear regression with quantitative variables and categorical variable
data = read.csv("/Users/angmingxuan/Downloads/kc_house_data.csv")
sellingprice = data$price
size = data$sqft_living
waterfront = factor(data$waterfront) #declare that the variable is measured by levels or categories
condition = data$condition #declare that the variable is measured by levels or categories
summary(waterfront) #see the distribution of the categorical data, if there is a majority categories, we can group the other categories together
condition = factor(ifelse(condition <= 3, "Bad", "Good"))
summary(condition)
M2 = lm(sellingprice ~ size + waterfront + condition) #good practice to put the quantitative variables first before categorical
summary(M2)

