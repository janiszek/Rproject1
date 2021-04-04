# Zadanie 1 ADNR
# 
# Krzysztof Janiszewski
# pd3469@pjwstk.edu.pl
# 
# 04.04.2021
# Update: ...


#1. Napisz funkcję sprawdzająca czy 1 liczba jest podzielna przez druga użyj - %%
divider<-function(x,y){
  if (y==0){
    result<-"Do not divide by 0!"
  }
  else{
    #result<-ifelse(x%%y==0,cat("The number: ",y," is a divider of:",x),
    #               cat("The number: ",y," is NOT a divider of:",x))
    result<-ifelse(x%%y==0,"It is a divider","It is NOT a divider")
  }
  result
}

divider(10,0)
divider(10,2)
divider(5,2)


#2. Pociąg z Lublina do Warszawy przejechał połowę drogi ze średnią prędkością 120 km/h. 
# Drugą połowę przejechał ze średnią prędkością 90 km/h. Jaka była średnia prędkość pociągu.

averageSpeed<-function(x,y){
  if (x==0 && y==0){
    result<-0
  }
  else{
    result<-2*(x*y)/(x+y)
  }
  result
}

averageSpeed(120,90)


#3. Utwórz funkcję obliczającą współczynnik korelacji r Pearsona dla 2 wektorów o tej samej długości.
# Wczytaj dane plik dane.csv i oblicz współczynnik dla wagi i wzrostu. W komentarzu napisz co oznacza wynik.

factorPearson<-function(x,y){
  if (length(x)!=length(y)){
    result<-"ERROR: Vectors need to of the same length!"
  }
  else{
    result<-cor(x,y, use="everything",method = "pearson")
  }
  result
}

factorPearson(1:4,4:6)
factorPearson(5:7,4:6)

df2<-read.csv2("data/dane.csv")
#View(df2)
str(df2)
summary(df2)
#factorPearson(df2$waga,df2$wiek)
#factorPearson(df2[[2]],df2[[3]])
attach(df2)
factorPearson(waga,wiek)

# wartość -0.003687698 współczynnika Pearsona sugeruje, że zmienne waga i wiek praktycznie nie maja korelacji na badanej próbce danych 
# co brzmi sensownie, bo badane byly tylko osoby dorosle wiek 20-72 lata 


#4. Napisz funkcję zwracającą ramke danych z danych podanych przez użytkownika 
# stworzDataFrame <- function(ile=1)
# W pierwszym wierszu użytkownik podaje nazwy kolumn. 
# W kolejnych wierszach zawartość wierszy ramki danych 
# (tyle wierszy ile podaliśmy w argumencie ile. ile=1 oznacza, że gdy użytkownik nie poda żadnej wartości jako parametr, domyślna wartością będzie 1)

createDataFrame <-function(count=1){
  message<- "Insert names of columns separated by comma: "
  columns<- as.character(strsplit(readline(message),",")[[1]])
  df <- as.data.frame(matrix(ncol = length(columns), nrow = 0))
  colnames(df)<- columns
  i <- 0
  while (i < count) {
    message<- "Insert next row of integer values separated by comma: "
    #let's assume the dataframe contains integers only
    values<- as.integer(strsplit(readline(message),",")[[1]])
    df_values<- data.frame(t(values))
    colnames(df_values)<- columns
    df<- rbind(df,df_values)
    i<- i + 1
  }
  df
}

createDataFrame(3)


#5 Napisz funkcję, która pobiera sciezkeKatalogu, nazweKolumny, jakaFunkcje, DlaIluPlikow i liczy: 
# mean, median,min,max w zależności od podanej nazwy funkcji w argumencie, z katologu który podaliśmy i z tylu plików ilu podaliśmy dla wybranej nazwy kolumny. 
# UWAGA: w podanych plikach R pobierając komórki nazwane liczbami R wstawi przed nazwy X. 
# Funkcję przetestuj dla katalogu smogKrakow.zip. Wykonując obliczenia pomiń brakujące wartości.


countFromFiles <- function(path="smog_data",colParam="142_humidity",functionParam="mean",fileCount=1){ 
  fileInDir<- list.files(path)
  result <- 0
  if (length(fileInDir)>0){
    totalDF<- data.frame()
    colName <- paste('X',colParam,sep='')
    iterations<- min(length(fileInDir),fileCount)
    for (i in 1:iterations) {
      fileName<-paste(path,fileInDir[i],sep='/')
      cat(paste(fileName, "\n"))
      tempDF<-read.csv(fileName)
      totalDF<-rbind(totalDF,tempDF)
    }
    if (functionParam=="mean"){
      cat(paste("Mean for column:", colParam, "\n"))
      result<- mean(na.omit(totalDF[,colName]))
    }
    else{
      if (functionParam=="median"){
        cat(paste("Median for column:", colParam, "\n"))
        result<- median(na.omit(totalDF[,colName]))
      }
      else{
        if (functionParam=="min"){
          cat(paste("Min for column:", colParam, "\n"))
          result<- min(na.omit(totalDF[,colName]))
        }
        else{
          #max
          cat(paste("Max for column:", colParam, "\n"))
          result<- max(na.omit(totalDF[,colName]))
        }
      }
    }
  }
  result
}


countFromFiles(colParam="142_pressure",functionParam="median",fileCount=100)
