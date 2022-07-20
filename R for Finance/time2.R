# Forecasting using AUTO.ARIMA model

library(forecast)
library(MLmetrics)
library(xts)

data(AirPassengers)
print(AirPassengers)
plot(AirPassengers, type="b")
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
deltat(AirPassengers)
time(AirPassengers)
cycle(AirPassengers)


## using moving average
ma(AirPassengers, order = 12)
plot(AirPassengers)
lines(ma(AirPassengers, order = 12), col = "red")
lines(ma(AirPassengers, order = 6), col = "blue")


### subset time series
time(AirPassengers)
train = window(AirPassengers, start=1949, end=1959.917)
test = window(AirPassengers, start=1960, end=1960.916)


### using AutoArima
fit <- auto.arima(train)
summary(fit)

pred <- predict(fit, n.ahead=11)
pred2 = as.vector(pred$pred)

##plotting
U <- pred$pred + 2*pred$se        # upper limit 95% confidence interval 
L <- pred$pred - 2*pred$se        # lower limit 95% confidence interval
ts.plot(AirPassengers, pred$pred, U, L, 
        col=c(1,2,4,4), lty = c(1,1,2,2))
legend("topleft", c("Actual", "Forecast", "Error Bounds (95% Confidence)"), 
       col=c(1,2,4), lty=c(1,1,2), bty = 'n')

# Machine learning metrics

MLmetrics::RMSE(pred2, test)
MLmetrics::R2_Score(pred2, test)


