library(dplyr)

d=read.csv("examdata.csv")
View(d)

sd(d$Oral.Exam)
mean(d$Discussions)
mean(d$Edpuzzle)
sd(d$Online.Quiz)
