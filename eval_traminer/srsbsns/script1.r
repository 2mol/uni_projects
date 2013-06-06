## -= Sammlung =- ##

data<-itt_l_diag_2

## New scale

duree<-data$fin_episode-data$debut_episode+1
duree_log2<-log2(as.numeric(duree))
duree_log2<-round(duree_log2)+1

min(long);max(long)
min(duree_log2);max(duree_log2)

newdata<-cbind(data,duree_log2) # Join the new data onto the last column

# summary(long_ep) ----> besser mat min, max()

## find stuff

which(data[1:20,9]=="a58062714206")
which(newdata[,2]>as.Date("2007-07-01"))

plot(density((as.numeric(reddata$naiss))),col="blue")
#hist(as.numeric(newdata$naiss)) # show the age distribution
windows()
nat_count<-table(newdata$natio)
barplot(nat_count[which(nat_count[]>5000)],main="Nationalit�s")

## Codes:
type_count<-table(newdata$icd_code,exclude="NA")
barplot(type_count,main="Types d'intervention")
table(newdata$icd_code)[15] #Na net weisen, well ze grouss

## pre-2005 raushuelen:
newnewdata<-newdata[newdata$debut_episode>as.Date("2006-01-01"),]
summary(newnewdata)

length(table(newnewdata$cident)) # weivill verschidden Leit sin et?

####=------- ----- --- -- -
###=-
##=- E bessen Restrictioun fir ze testen:
#=-
reddata<-newnewdata[which(newnewdata$fin_episode<as.Date("2007-01-01")),]

dim(reddata)
#hist(as.numeric(reddata$naiss))
plot(density((as.numeric(reddata$naiss))),col="blue")
windows()
nat_count<-table(reddata$natio)
barplot(nat_count[which(nat_count[]>1000)],main="Nationalit�s")

##=- Nach m�i (komplett verf�lscht, wiirklech JUST fir ze testen)

reddata<-reddata[which(reddata$icd_code!="NA"),]
length(table(reddata$cident)) # --> nach 73'565 Leit dei iwwreg bleiwen.


## Datum upassen - Deeg:
debut<-as.numeric(reddata$debut_episode-as.Date("2005-12-31"))
fin<-as.numeric(reddata$fin_episode-as.Date("2005-12-31"))
#duree<-fin-debut+1
reddata<-cbind(reddata,debut,fin)


## Endlech:
#smalldata.seq<-seqdef(reddata,var=c("cident","debut","fin","icd_code"),informat="SPELL",process=FALSE,left="DEL",right="DEL")
#seqdef(reddata,2:3,informat="SPELL",left="DEL",right"DEL",gaps=???)

#data.labels<-seqstatl(reddata$icd_code)
#data.states<-1:19
## oder:
data.states<-seqstatl(reddata$icd_code)
data.states<-append(data.states,"TR") # travail

data.labels<-c("actes chir","cancer","traumat","syst nerveux","infect ou parasit",
"digest non-infect","malad de la peau","inflamm ost�o-artic","degen ost�o-artic",
"g�nito-urin","ORL et dent","oeil et annex","malad circulation","respi non-infect",
"troubles mentaux","endocr-nutri-m�tabol","compl grossesse","cures therm","autre","travaillant")

#nach e bessen simpl.
#reddata$debut<-round(reddata$debut/2)
reddata$debut<-floor(reddata$debut/4)
#reddata$fin<-round(reddata$fin/2)
reddata$fin<-floor(reddata$fin/4)

smalldata.seq<-seqdef(reddata, var=c("cident","debut","fin","icd_code"),
informat="SPELL", states=data.states, labels=data.labels,
process=FALSE, left="DEL", right="DEL", gaps="TR")
# stats mat axis = 1->182
# start: 14h30
# -stop: 16h15

attr(smalldata.seq, "cpal")<- c("#ffccff", "#ff99ff", "#ff55bb", "#ffaaaa", "#ffbb99",
"#ff9933", "#ffcc11", "#ffee44", "#009999", "#33ccff",
"#1177ff", "#bbddff", "#990033", "#004411", "#cccc00",
"#999900", "#440011", "#770044", "#bbdd00", "#eeeeff")

#=-
##=-
###=-

## E puer Saachen:
seqiplot(smalldata.seq[1:500,],tlim=0,withlegend=F,border=NA,title="Quelques s�quences")
seqdplot(smalldata.seq,border=NA,title="Densit�s")

turb<-seqST(smalldata.seq)
plot(density(turb),xlab="Turbulence",main = "Sequence turbulence",col="blue")
hist(turb, col = "cyan", main = "Sequence turbulence")
seqHtplot(smalldata.seq, title = "Entropy index")

####=- ---------------------------= ##
## =---- v�lleg iwwerfl�sseg: ----= ##

## Convert time to numeric

#start1<-mat.or.vec(20,1)
#start2<-mat.or.vec(20,1)
#start3<-mat.or.vec(20,1)
#start4<-mat.or.vec(20,1)
#
#for ( i in 1:20 ) start1[i]<-toString(data[i,2])
#for ( i in 1:20 ) start2[i]<-strsplit(start[[i]],"-")
#for ( i in 1:20 ) start3[i]<-lapply(start2[i],paste,collapse="")
#for ( i in 1:20 ) start3[i]<-lapply(start3[[i]],as.numeric)
#for(i in 1:20) start4[i]<-start3[[i]]
## --

## oder mei einfach:

as.numeric(gsub("-","",data[,2]))

##

# lapply(data[1,2],as.numeric)
# start<-strsplit(toString(data[,2]), "-")