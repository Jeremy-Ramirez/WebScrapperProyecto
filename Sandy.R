library(readxl)
library(ggplot2)
library(ggeasy)
library(hrbrthemes)
library(readr)
library(tidyverse)

netzun<- read.csv(file.choose())
names(netzun)
#rename(netzun, c(T�.tuloCurso=TituloCurso,Duración=Duracion,Calificación=Calificacion))
View(netzun)


reed<- read.csv(file.choose())
View(reed)

tutellus<- read.csv(file.choose())
View(tutellus)

lenguajes <- c("PHP", "Ruby", "Dart", "Java", "Python", "Javascript", "Typescript", "C++", "C#", "CSS", "HTML", "SQL","Angular", "Django", "Vue", "Rails", "Express", "Laravel", "Spring") 
str_to_upper(lenguajes)
titulocursonetzun <- netzun$T�.tuloCurso
titulocursoreed  <- reed$T�.tuloCurso
titulocursotutellus <- tutellus$T�.tuloCurso

str_to_upper(titulocursonetzun)

cantenguajes<-length(lenguajes) 

cantnetzun<- c()
cantreed<- c()
canttute<- c()

for(i in 1:cantenguajes) {
  cantnetzun <- c(cantnetzun,sum(str_detect(titulocursonetzun, lenguajes[i])))
  cantreed <- c(cantreed,sum(str_detect(titulocursoreed, lenguajes[i])))
  canttute <- c(canttute,sum(str_detect(titulocursotutellus, lenguajes[i])))
  
}
cantnetzun
cantreed
canttute
length(cantnetzun)
length(cantreed)
length(canttute)

Plataformas <- c(rep("Netzun",19), rep("Tutellus",19), rep("Reed",19)) 
cantidad<- c(cantnetzun, canttute, cantreed) 
len <- c(lenguajes, lenguajes, lenguajes) 
resumen<- data.frame(
  "Cantidad" = cantidad,
  "Lenguajes" = len, 
  "Plataformas" = Plataformas 
)
resumen

ggplot(resumen,mapping=aes(x=len,y=cantidad,fill=Plataformas))+
  geom_bar(stat = "Identity",position = 'dodge')+
  theme_ipsum()+
  coord_flip()+
  ggtitle("Cantidad de cursos de diversos lenguajes y \n frameworks por plataforma")+
  ggeasy::easy_center_title()+
  labs(x = "Lenguajes y Frameworks",y = "Cantidad de cursos")

