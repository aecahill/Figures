# Figure 2a (comparing observed and predicted through time)

#colors
colfig2a<-c("red","purple","cyan","grey")

#make predicted values

#black-white; position dodge no longer works
#predictions<-ggplot(data=predobs, aes(x=Time, y=Predict)) + geom_line(aes(linetype=Treatment,color=Treatment),size=1)+ylab("Proportion of larvae settled\n")+xlab("\nTime Course (hours)")+theme_bw()+ylim(0,1)+theme(legend.position=c(.1,.75)) + theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+theme(axis.title.x = element_text(size=10))+theme(axis.title.y=element_text(size=10))+theme(legend.title=element_text(size=10,face="plain"))+scale_colour_manual(values=graycolors)

#color
predictions<-ggplot(data=predobs, aes(x=Time, y=Predict)) + geom_line(aes(linetype=Treatment,color=Treatment),size=1)+ylab("Proportion of larvae settled")+xlab("\nTime Course (hours)")+theme_bw()+ylim(0,1)+theme(legend.position=c(.1,.75)) + theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+theme(axis.title.x = element_text(size=10))+theme(axis.title.y=element_text(size=10))+theme(legend.title=element_text(size=10,face="plain"))+scale_colour_manual(values=colfig2a)

#add observations

#black-white; position dodge no longer works
#predictions+geom_point(data=predobs, aes(x=Time, y=Observe, colour=Treatment, shape=Treatment),size=3)+geom_errorbar(aes(ymin=Observe-Error, ymax=Observe+Error), width=.1, position=pd)

#color (requires a file where there is a vector of color names, length=220)
predictions+geom_point(data=predobs, aes(x=Time, y=Observe, color=Treatment),size=3)+geom_errorbar(aes(ymin=Observe-Error, ymax=Observe+Error),width=.1,color=colobs2a$V1)

#Figure 2b (regression of observed and predicted)

ggplot(fig2b, aes(x=Observed, y=Predicted)) +geom_point(size=3.5, color="#696969")+geom_smooth(method=lm,size=1,se=FALSE, color="black")+theme_bw()+theme(panel.grid.major=element_blank())+scale_y_continuous(limits=c(0,1))+scale_x_continuous(limits=c(0,1))+xlab("\nObserved Proportion of Larvae Settled")+ylab("Predicted Proportion of Larvae Settled\n")+scale_color_manual(values=greyscale)


#Figure 3 (timecourse data)

#colors
colfig3<-c("red","grey","#333333","cyan")

#black-white; position dodge no longer works
#ggplot(data=fig3, aes(x=Time, y=Settle, colour=Treatment, shape=Treatment)) + geom_line(aes(linetype=Treatment),size=1)+geom_point(size=3)+ylab("Proportion of larvae settled\n")+xlab("\nTime Course (hours)")+theme_bw()+ylim(0,0.6)+theme(legend.position=c(.1,.75))+geom_errorbar(aes(ymin=Settle-Error, ymax=Settle+Error), width=.1, position=pd) + theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+theme(axis.title.x = element_text(size=10))+theme(axis.title.y=element_text(size=10))+theme(legend.title=element_text(size=10,face="plain"))+scale_colour_manual(values=graycolors)

#color
ggplot(data=fig3, aes(x=Time, y=Settle, colour=Treatment)) + geom_line(aes(linetype=Treatment),size=1)+geom_point(size=3)+ylab("Proportion of larvae settled\n")+xlab("\nTime Course (hours)")+theme_bw()+ylim(0,0.6)+theme(legend.position=c(.1,.75))+geom_errorbar(aes(ymin=Settle-Error, ymax=Settle+Error), width=.1) + theme(panel.grid.minor=element_blank(), panel.grid.major=element_blank())+theme(axis.title.x = element_text(size=10))+theme(axis.title.y=element_text(size=10))+theme(legend.title=element_text(size=10,face="plain"))+scale_colour_manual(values=colfig3)

#Figure 4 (posthoc comparisons)

#colors
colfig4<-c("red","#333333","cyan")

#black-white; position dodge no longer works
#ggplot(data=fig4,aes(x=Treatment,y=MeanDiff))+geom_bar(stat="identity")+geom_errorbar(aes(ymin=MeanDiff-CI, ymax=MeanDiff+CI), width=.1, position=pd) +theme_bw()+theme(panel.grid.major=element_blank())+scale_y_continuous(limits=c(0,0.025))+xlab("\nTreatment")+ylab("Difference between treatment and control\n")

#color and with updated pd
ggplot(data=fig4,aes(x=Treatment,y=MeanDiff))+geom_bar(stat="identity", aes(fill=Treatment))+geom_errorbar(aes(ymin=MeanDiff-CI, ymax=MeanDiff+CI), width=.1) +theme_bw()+theme(panel.grid.major=element_blank())+scale_y_continuous(limits=c(0,0.025))+xlab("\nTreatment")+ylab("Difference between treatment and control\n")+scale_fill_manual(values=colfig4)+theme(legend.position="none")