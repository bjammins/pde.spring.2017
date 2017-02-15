library(ggplot2)
library(dplyr)


setwd('L:/Postpartum Discharge Education/pde.spring.2017/data')

#hospital birth categories
hosp_cat<-c("Under 1000", "1001-2999","3000-4999", "5000+")
n<-as.numeric(c(5,6,3,3))
hosp<-cbind(hosp_cat,n)
hosp<-as.data.frame(hosp)
hosp$n<-as.numeric(as.character(hosp$n))
hosp_sum<-sum(hosp$n)

hosp$percent<-round((hosp$n/hosp_sum)*100,digits=1)
hosp$percent_lab <- paste(hosp$percent,"%", sep="")


hosp$hosp_cat <- factor(hosp$hosp_cat, levels=c("Under 1000", "1001-2999","3000-4999", "5000+"))

hosp$pos <- (cumsum(hosp$percent)-hosp$percent/2)  #calculate label position


pdf("hospital counts by delivery category.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent_lab),position=position_fill(vjust = 0.5)) + ylab("n = 17")
c <- c + scale_fill_discrete(name="Annual Birth Volume")
c <- c + theme(axis.text = element_blank(),axis.ticks = element_blank(), panel.grid  = element_blank(),  axis.title.y = element_blank())
c
dev.off()




#How many RNs does your hospital anticipate will need education about maternal morbidity and mortality and the AWHONN's POST-BIRTH Warning Signs initiative?
hosp_cat<-c("Under 20", "20-49","50-99", "100+")
n<-as.numeric(c(2,2,7,6))
hosp<-cbind(hosp_cat,n)
hosp<-as.data.frame(hosp)
hosp$n<-as.numeric(as.character(hosp$n))
hosp_sum<-sum(hosp$n)

hosp$percent<-round((hosp$n/hosp_sum)*100,digits=1)
hosp$percent_lab <- paste(hosp$percent,"%", sep="")


hosp$hosp_cat <- factor(hosp$hosp_cat, levels=c("Under 20", "20-49","50-99", "100+"))

hosp$pos <- (cumsum(hosp$percent)-hosp$percent/2)  #calculate label position


pdf("number of nurses educated.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent_lab),position=position_fill(vjust = 0.5)) + ylab("n = 17")
c <- c + scale_fill_discrete(name="Nurses Educated")
c <- c + theme(axis.text = element_blank(),axis.ticks = element_blank(), panel.grid  = element_blank(),  axis.title.y = element_blank())
c
dev.off()



#Currently, does your hospital use a standard checklist of topics to discuss related to signs and symptoms of postpartum complications?
hosp_cat<-c("Yes", "No")
n<-as.numeric(c(12,5))
hosp<-cbind(hosp_cat,n)
hosp<-as.data.frame(hosp)
hosp$n<-as.numeric(as.character(hosp$n))
hosp_sum<-sum(hosp$n)

hosp$percent<-round((hosp$n/hosp_sum)*100,digits=1)
hosp$percent_lab <- paste(hosp$percent,"%", sep="")


hosp$hosp_cat <- factor(hosp$hosp_cat, levels=c("Yes", "No"))

hosp$pos <- (cumsum(hosp$percent)-hosp$percent/2)  #calculate label position


pdf("standardized checklist.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent_lab),position=position_fill(vjust = 0.5)) + ylab("n = 17")
c <- c + scale_fill_discrete(name="Use a standard checklist?")
c <- c + theme(axis.text = element_blank(),axis.ticks = element_blank(), panel.grid  = element_blank(),  axis.title.y = element_blank())
c
dev.off()


#EMR
hosp_cat<-c("Cerner", "CPN", "Epic (Stork)", "Other")
n<-as.numeric(c(3,1, 4, 10))
hosp<-cbind(hosp_cat,n)
hosp<-as.data.frame(hosp)
hosp$n<-as.numeric(as.character(hosp$n))
hosp_sum<-sum(hosp$n)

hosp$percent<-round((hosp$n/hosp_sum)*100,digits=1)
hosp$percent_lab <- paste(hosp$percent,"%", sep="")


hosp$hosp_cat <- factor(hosp$hosp_cat, levels=c("Cerner", "CPN", "Epic (Stork)", "Other"))

hosp$pos <- (cumsum(hosp$percent)-hosp$percent/2)  #calculate label position


pdf("EMR.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent_lab),position=position_fill(vjust = 0.5)) + ylab("n = 17")
c <- c + scale_fill_discrete(name="EMR")
c <- c + theme(axis.text = element_blank(),axis.ticks = element_blank(), panel.grid  = element_blank(),  axis.title.y = element_blank())
c
dev.off()

