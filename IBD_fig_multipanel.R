library(ggplot2)

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

asquibd<-read.table("C:/Users/Abigail/Desktop/asquibd.txt")
crubibd<-read.table("C:/Users/Abigail/Desktop/crubibd.txt")
ecoribd<-read.table("C:/Users/Abigail/Desktop/ecoribd.txt")
hmaribd<-read.table("C:/Users/Abigail/Desktop/hmaribd.txt")
mtruibd<-read.table("C:/Users/Abigail/Desktop/mtruibd.txt")
olonibd<-read.table("C:/Users/Abigail/Desktop/olonibd.txt")
pcaeibd<-read.table("C:/Users/Abigail/Desktop/pcaeibd.txt")
pclaibd<-read.table("C:/Users/Abigail/Desktop/pclaibd.txt")
plivibd<-read.table("C:/Users/Abigail/Desktop/plivibd.txt")

asquplot<-ggplot(asquibd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Asqu")+ylab("Fst/(1-Fst)")
crubplot<-ggplot(crubibd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Crub")+ylab("Fst/(1-Fst)")+ylim(0,0.18)+annotate("text",x=1230,y=0.17,label="*",size=10)
ecorplot<-ggplot(ecoribd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Ecor")+ylab("Fst/(1-Fst)")
hmarplot<-ggplot(hmaribd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Hmar")+ylab("Fst/(1-Fst)")+annotate("text",x=250,y=1.8,label="*",size=10)
mtruplot<-ggplot(mtruibd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Mtru")+ylab("Fst/(1-Fst)")
olonplot<-ggplot(olonibd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Olon")+ylab("Fst/(1-Fst)")
pcaeplot<-ggplot(pcaeibd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Pcae")+ylab("Fst/(1-Fst)")
pclaplot<-ggplot(pclaibd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Pcla")+ylab("Fst/(1-Fst)")+ylim(0,0.17)+annotate("text",x=830,y=0.15,label="*",size=10)
plivplot<-ggplot(plivibd, aes(x=V1, y=V2)) +geom_point(size=1.5)+geom_smooth(method=lm,size=1,se=FALSE,col="black")+theme_bw()+theme(panel.grid.major=element_blank())+xlab("Distance Pliv")+ylab("Fst/(1-Fst)")
multiplot(asquplot,hmarplot,mtruplot,crubplot,pclaplot,pcaeplot,olonplot,ecorplot,plivplot,cols=3)
