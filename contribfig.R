contrib3<-read.table("C:/Users/acahill/Desktop/contrib3.txt",header=TRUE)

sppcol<-c("gold","red","cyan","green","orange","brown","darkgrey","magenta","purple")

#function for standard error bars
data_summary <- function(x) {
  m <- mean(x)
  sdev<-sd(x)
  nofx<-length(x)
  se<-sdev/sqrt(nofx)
  ymin <- m-se
  ymax <- m+se
  return(c(y=m,ymin=ymin,ymax=ymax))
}

ggplot(contrib3, aes(x=Zone, y=Cs))+ 
 geom_jitter(aes(color =Species),position=position_jitter(0.2),cex=3)+
  scale_colour_manual(values=sppcol)+
 theme_bw()+
 theme(panel.background = element_blank(), 
panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  plot.background = element_blank())+ 
  xlab("\nZone")+ylab("Cs\n")+
  scale_x_discrete(labels=c("1","2","3","4","5","6","7","8","9"))+
  stat_summary(fun.data=data_summary, geom="pointrange", color="black",cex=1)+
  geom_hline(yintercept=0)
