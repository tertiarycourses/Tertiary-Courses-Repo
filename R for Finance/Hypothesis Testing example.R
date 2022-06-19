S_and_P = read.csv("/Users/Downloads/sp-500-historical-annual-returns (2).csv") #input own file pathname
Djia = read.csv("/Users/Downloads/DJIa.csv") #input own file pathname
testing_population = Djia$value
benchmark = mean(S_and_P$value)
#H0: returns for Djia is not worse than S&P (i.e. population_mean (i.e. mu) - benchmark = 0)
#H1: returns for Djia is worse than S&P (i.e. population_mean (i.e. mu) - benchmark < 0)

#Test at 5% significance level
##Method 1: Manually calculate p-value

sd = sd(testing_population)
mean = mean(testing_population)
size = length(testing_population)
test_statistic = (mean-benchmark)/(sd/sqrt(size))
probability  = pt(test_statistic,df=size-1) #degrees of freedom = sample size - 1
#since it is a one-tailed test, p-value = probability. If it was two-tailed test, then p-value = 2*probability.
p_value = probability
p_value

##Method 2: using the in-built hypothesis testing function in R
t.test(testing_population,mu = benchmark, alternative ="less", conf.level=0.95)

