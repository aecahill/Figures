Library(ggplot2)
osmo<-read.table("C:/Users/acahill/Desktop/osmoregulation.txt",header=TRUE)

ggplot(osmo,aes(Time,percent_change2))+
  geom_point(aes(color=Organism),size=4)+
  geom_line(aes(color=Organism), size = 2)+
  theme_bw()+
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.background = element_blank())+
  theme(axis.text.x= element_text(size=16))+
  theme(axis.text.y= element_text(size=16))+
  theme(axis.title.x=element_text(size=16))+
  theme(axis.title.y=element_text(size=16))+
  scale_colour_manual(values=c("red3","gold1","grey40","black","blue","green4","green","olivedrab1"))+
  ylim(0.95,1.15)+
  xlab("\nTime (minutes)")+ylab("Percent change \n")