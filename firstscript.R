install.packages("httr")
install.packages("jsonlite")
library(httr)
library(jsonlite)
#require() - zwróci false jesli się nie uda (przydaje się w funkcjach)

print("hello")
endpoint <- "https://api.openweathermap.org/data/2.5/weather?q=Warszawa&appid=1765994b51ed366c506d5dc0d0b07b77"
getWeather<- GET(endpoint)
#getWeather$content
#pobieramy content jako text
weatherText <- content(getWeather,"text")
#z JSON pobranego przez GET tworzymy obiekt w R
weatherJson <- fromJSON(weatherText,flatten = TRUE)
#konwertujemy do DF
weatherDF <- as.data.frame(weatherJson)
View(weatherDF)

x <- 123.4
x <- "string"
x <- 1:100

?vector
#true nawet dla 1 wartosci
is.vector(x)
#podaje typ wektora
class(x)
typeof(x)

#laczenie - combine
x <- c(1,2,3,4,5)
x
#konwertuje do typu numeric
x<-c(x,FALSE)
class(x)
#zamiana na wartosc logiczna
as.logical(x)
#ale x ma nadal liczby!!!
x
#POPRAWIENIE
y<-as.logical(x)
y
z<-as.integer(y)
z

getwd()
#setwd("...")

x2 <-c(1.2,2.2,3.3,4.4)
v<-c("1","2","3","4")
z2 <- c(x,x2,v)
z2

bool <- vector(mode = 'logical' , length=0)
bool

x<- c(1,2,3,4,5,6,7,8,9,10)
y<-c(2,4)
z1<-x+y
z2<-x-y
z3<-x*y

x<- c(1,2,3,4,5,6,7,8,9,10)
y<-c(2)
wynik1 <-x/y
# %% - reszta z dzielenia
wynik2 <-x%%y
# %/% - czesc calkowita
wynik3 <-x%/%y


#lista wektorow
lista <- list(1,2,3,4,5)
lista<- list(c(1,2),c("a","b"), wynik3)
wynik[1]
lista[3]
#nie dziala - to zwraca liste, a nie wektor
class(lista[3][1])
#aby pobrac wektor z listy to trzeba podwojny nawias kwadratowy [[]]
class(lista[[3]])

#wybiera z listy 3 tylko te ktore spelniaja warunek
lista[[3]] [lista[[3]]>1]

#mamy wektor logiczny
lista[[3]]>1

#filtrowanie wektora
v1<- c(1,2,3,4,5,6,7,8,9,10)
v2<-c(2)
wynik <- v1*2
#filtruj tylko te, ktora sa >10
wynik [wynik>10]

#uzycie sequence
sekwencja <- seq(1,10,0.5)
sekwencja <- seq(1,10,1)
sekwencja <- seq(10,1,-1)

#factor
plec<-c("kobieta","mezczyzna","mezczyzna","kobieta")
plec
plecf<-as.factor(plec)
plecf
#kobieta =1, miezczyzna =2
unclass(plecf)

#przypisanie mezczyzna=1 -> levels
plecf2<-factor(c("mezczyzna", "kobieta","mezczyzna","kobieta"), 
               levels=c("mezczyzna","kobieta"))
unclass(plecf2)

#podstaw wartosc dla range
plecf[3:8]<-NA
#sprawdz is null
brakujace<-is.na(plecf)

#negowanie wartości - !
!brakuje

#wybierz te wartosci, ktore nie sa na
wplec <- plecf[!brakujace]
plecf[complete.cases(plecf)]

#macierze
mojaMacierz <- matrix(nrow=10,ncol=9)
#macierz pusta - NA
mojaMacierz

#wypelnianie macierzy wektorem kolumnami
kk <- seq(1, 90, 1)
mojaMacierz <- matrix(kk, nrow=10, ncol=9)
mojaMacierz
#drugi sposob
mojaMacierz<-matrix(data=seq(1,90,1),nrow=10,ncol=9)
mojaMacierz

#wierszami
mojaMacierz<-matrix(data=seq(1,45,1),nrow=10,ncol=9, byrow = TRUE)
mojaMacierz

#dostep do elementów macierzy
mojaMacierz[1,]
mojaMacierz[,2]
mojaMacierz[2,3]

v1
wynik
#bindowanie - kolumnami lub wierszami
res <- cbind(v1,wynik)
res
res2 <- rbind(v1, wynik)
res2

#dataframe
df <- data.frame(index=1:3,
                 imie=c("jan","alina","bartek"),
                 plec=c("mezczyzna","kobieta","mezczyzna"))

#ZLE
df2 <-read.table(file="dane.csv")
View(df2)

#?read.csv dla separatorow jako ;
df2<-read.csv2("dane.csv")
View(df2)


#funkcje
hello<-function(x){
  print(paste0(x," witaj R i R studio!!"))
}

dziel<-function(x,y){
  if (y==0){
    wynik<-" nie dziel przez zero"
  }
  else{
    wynik<-x/y
  }
  wynik
}

#pobieranie danych o uzytkownika
dzielKlawiatura<-function(){
  komunikat<-"podaj 2 liczby oddzielone przecinkiem: "
  wektorOdp<-as.numeric(strsplit(readline(komunikat),",")[[1]])
  l1<-wektorOdp[1]
  l2<-wektorOdp[2]
  if(l2==0){
    v<-"nie dziel przez zero"
  }
  else{
    v<-l1/l2
  }
  v
}


