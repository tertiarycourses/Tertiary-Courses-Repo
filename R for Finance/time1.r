#Monthly Airline Passenger Numbers 1949-1960
?AirPassengers
AirPassengers
class(AirPassengers)
plot.ts(AirPassengers)
dap = decompose(AirPassengers)
plot(dap)

library(TSstudio)
## basic plots
ts_plot(AirPassengers)
ts_ma(AirPassengers)
ts_heatmap(AirPassengers)
ts_seasonal(AirPassengers)
ts_decompose(AirPassengers)
monthplot(AirPassengers)
boxplot(AirPassengers ~ cycle(AirPassengers))