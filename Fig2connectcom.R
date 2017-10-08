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

datakey2<-read.table("C:/Users/Abigail/Desktop/datakey2.txt",header=TRUE)
datakeymar<-read.table("C:/Users/Abigail/Desktop/datakeymar.txt",header=TRUE)

Dglob<-ggplot(data = datakey2, aes(x = Dev_type, y = Dest)) + geom_jitter(position=position_jitter(0.2))+theme_bw()+theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+ylab("D\n")+xlab("Larval type")+ theme(axis.title.x = element_text(size=16))+theme(axis.title.y=element_text(size=16))+guides(fill=FALSE)+scale_fill_manual(values=greyscale)+scale_y_continuous(limits=c(-0.1,1))
ppglob<-ggplot(data = datakey2, aes(x = Dev_type, y = Mean_Fst_pairwise)) + geom_jitter(position=position_jitter(0.2))+theme_bw()+theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+ylab("Pairwise Fst\n")+xlab("Larval type")+ theme(axis.title.x = element_text(size=16))+theme(axis.title.y=element_text(size=16))+guides(fill=FALSE)+scale_fill_manual(values=greyscale)+scale_y_continuous(limits=c(-0.1,1))
Dmar<-ggplot(data = datakeymar, aes(x = Dev_type, y = D)) + geom_jitter(position=position_jitter(0.2))+theme_bw()+theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+ylab("D\n")+xlab("Larval type")+ theme(axis.title.x = element_text(size=16))+theme(axis.title.y=element_text(size=16))+guides(fill=FALSE)+scale_fill_manual(values=greyscale)+scale_y_continuous(limits=c(-0.1,1))
ppmar<-ggplot(data = datakeymar, aes(x = Dev_type, y = ppfst)) + geom_jitter(position=position_jitter(0.2))+theme_bw()+theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+ylab("Pairwise Fst\n")+xlab("Larval type")+ theme(axis.title.x = element_text(size=16))+theme(axis.title.y=element_text(size=16))+guides(fill=FALSE)+scale_fill_manual(values=greyscale)+scale_y_continuous(limits=c(-0.1,1))
multiplot(Dglob,ppglob,Dmar,ppmar, cols=2)
