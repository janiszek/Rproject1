install.packages("httr")
install.packages("jsonlite")
library(httr)
library(jsonlite)
#require()

print("hello")
endpoint <- "https://api.openweathermap.org/data/2.5/weather?q=Warszawa&appid=1765994b51ed366c506d5dc0d0b07b77"
getWeather<- GET(endpoint)
#getWeather$content
weatherText <- content(getWeather,"text")
weatherJson <- fromJSON(weatherText,flatten = TRUE)

