# read data from CSV file
forecast <- read.csv('abbeville.csv', header = TRUE)
head(forecast)
# plot time series
plot.ts(forecast$Incoming.Examinations)
# forecast using Holt-Winters Exponential Smoothing
forecast.mean <- HoltWinters(forecast$Incoming.Examinations,alpha = .06, beta = TRUE, gamma = FALSE)
forecast.predict <- predict(forecast.mean, n.ahead = 12, prediction.interval = TRUE)
forecast.predict
# look at the fitted values
forecast.mean$fitted
#Plot Data
plot.ts(forecast$Incoming.Examinations, ylim=c(0,11000), xlim=c(0,110))
lines(forecast.mean$fitted[,1], col="green")
lines(forecast.predict[,1], col="blue")
lines(forecast.predict[,2], col='red')
lines(forecast.predict[,3], col="orange")

#########################################################################################################
# install the "forecast" package
install.packages("forecast")
require(forecast)
TS <- ts(forecast$Incoming.Examinations)
plot(TS, ylab = "Incoming.Examinations", xlab = "Month")
acf(TS)
pacf(TS)
ndiffs(x = TS)
#ndiff returns 1 requireing ARIMA
plot(diff(TS, 1))
ARIMAforcast <- auto.arima(x = TS)
#CHeck the Resuduals
acf(ARIMAforcast$residuals)
pacf(ARIMAforcast$residuals)
#create the forecasted values and plot them
NextVals <- forecast.Arima(ARIMAforcast, h=12)
NextVals
plot.forecast(NextVals)
