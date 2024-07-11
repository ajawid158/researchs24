library(dplyr)
library(ggplot2)


dt=read.csv("examdata.csv")


summarise(dt, mean(Online.Quiz), mean(Project), mean(Discussions), 
          mean(Edpuzzle), mean(Oral.Exam))


d=read.csv("assessment.csv")
head(d)

AsT=c()
for (i in 1:length(d$AssType)) {
  if(d$AssType[i]==0){
    AsT[i]="Dis"
  } else if (d$AssType[i]==1){
    AsT[i]="EdP"
  } else if (d$AssType[i]==2){
    AsT[i]="Qu"
  } else {
    AsT[i]="OE"
  }
  
  
}

head(AsT)

d=cbind(d, AsT)
head(d)


boxplot(Score~AsT,
        data=d,
        col="gray",
        horizontal = T, 
        xlab="",
        ylab = "")

stripchart(Score~AsT,
           data = d,
           method = 'jitter', 
           pch=20,
           col=2:5,
           add = TRUE)

g0=ggplot(d, aes(x=Score, color=AsT))
g0+geom_density()+
  theme_classic()+
  xlim(10,115)+
  theme(plot.title = element_text(face="bold",
                                  hjust = .5), 
        axis.title.x = element_text(),
        axis.title.y = element_text(), 
        legend.title = element_text(color='blue'),
        legend.position = "top")+
  xlab("")+
  ylab("")

