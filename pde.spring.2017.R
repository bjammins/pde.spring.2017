library(ggplot2)

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

pdf("hospital counts by delivery category.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent,ymax=percent),position=position_fill(width=1))
c
dev.off()


#NICU Level
hosp_cat<-c("Level I", "Level II","Level III", "Level IV")
n<-as.numeric(c(2,8,11,2))
hosp<-cbind(hosp_cat,n)
hosp<-as.data.frame(hosp)
hosp$n<-as.numeric(as.character(hosp$n))
hosp_sum<-sum(hosp$n)

hosp$percent<-hosp$n/hosp_sum

pdf("hospital counts by NICU Level.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent,ymax=percent),position=position_fill(width=1))
c
dev.off()


#Location of Triage
hosp_cat<-c("Separate triage intake room", "Triage evaluation area","Same room as where labor and birth occurs", "Other")
n<-as.numeric(c(7,12,3,1))
hosp<-cbind(hosp_cat,n)
hosp<-as.data.frame(hosp)
hosp$n<-as.numeric(as.character(hosp$n))
hosp_sum<-sum(hosp$n)

hosp$percent<-hosp$n/hosp_sum

pdf("Triage area.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent,ymax=percent),position=position_fill(width=1))
c
dev.off()


#EMR

hosp_cat<-c("Cerner", "Epic","CPN (GE)", "Other")
n<-as.numeric(c(2,15,5,1))
hosp<-cbind(hosp_cat,n)
hosp<-as.data.frame(hosp)
hosp$n<-as.numeric(as.character(hosp$n))
hosp_sum<-sum(hosp$n)

hosp$percent<-hosp$n/hosp_sum

pdf("EMR.pdf",width=7,height=5)
c <- ggplot(hosp, aes(x=factor(1), y=as.numeric(n),fill=factor(hosp_cat),label=percent))
c<-c+geom_bar(stat="identity",width=1,position="fill")
c <-c + coord_polar(theta="y")
c<-c+geom_text(aes(x=factor(1), y=percent, label=percent,ymax=percent),position=position_fill(width=1))
c
dev.off()
