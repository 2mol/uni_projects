#
# TraMineR Package
# Biofam Data
#
# Test plotting & clustering
#
# Start with "source("C:/_path_/test_biofam.r", chdir=T)"
#

#initial.dir<-getwd()
#setwd("C:/Documents and Settings/igjchome/Desktop/R_scripts/biofam_test")
#setwd("data")

#==--- Libs: ---==#
library(TraMineR)
library(cluster)

#==--- Setup: --==#
data(biofam)

biofam.labels <- c("parent","left","married","left+marr","child","left+child","left+marr+child","divorced")
biofam.scode <- c("P","L","M","LM","C","LC","LMC","D")
biofam.seq <- seqdef(biofam, 10:25,states=biofam.scode,labels=biofam.labels)
rm(biofam.scode,biofam.labels)

#==--- Start: ---==#

windows(3,4)
par(mfrow=c(1,1))
seqlegend(biofam.seq, fontsize = 0.8)
windows()

par(mfrow=c(1,1))
seqiplot(biofam.seq[1:200,], tlim=0, border=NA, space=0, withlegend=F, title="Plot of 200 sequences")

readline("<Enter> to continue")

par(mfrow=c(2,2))
seqdplot(biofam.seq, withlegend=F, title="Distribution")
seqfplot(biofam.seq, withlegend=F, title="10 most frequent sequences")

turb<-seqST(biofam.seq)
plot(density(turb),xlab="Turbulence",main = "Sequence turbulence",col="blue")
#hist(turb, col = "cyan", main = "Sequence turbulence")
seqHtplot(biofam.seq, title = "Entropy index")

rm(turb)

readline("<Enter> to continue")
par(mfrow=c(1,2))
seqdplot(biofam.seq, group=biofam$sex, withlegend=F, title="Distribution par sexe")

readline("<Enter> to continue")

#----= Metric: =----#
#-------------------#

### Longest-Common-Prefix Method (LCP)
#cat("LCP")
#dist.lcp1 <- seqdist(biofam.seq, method = "LCP")
#clusterward1 <- agnes(dist.lcp1, diss = TRUE, method = "ward")
#rm(dist.lcp1)
load("data/clusterward1.RData")
#
### Longest-Common-Suffix (RLCP)
#cat("RLCP")
#dist.rlcp1 <- seqdist(biofam.seq, method = "RLCP")
#clusterward2 <- agnes(dist.rlcp1, diss = TRUE, method = "ward")
#rm(dist.rlcp1)
load("data/clusterward2.RData")
#
### Longest-Common-Subsequence (LCS)
#cat("LCS")
#dist.lcs1 <- seqdist(biofam.seq, method = "LCS")
#clusterward3 <- agnes(dist.lcs1, diss = TRUE, method = "ward")
#rm(dist.lcs1)
load("data/clusterward3.RData")
#
### Optimal-Matching (OM)
#cat("OM")
#submat <- seqsubm(biofam.seq, method = "TRATE") #substitution costs by transition rates. Other possible option: "CONSTANT"
#dist.om1 <- seqdist(biofam.seq, method = "OM", indel = 1, sm = submat)
#clusterward4 <- agnes(dist.om1, diss = TRUE, method = "ward")
#rm(submat,dist.om1)
load("data/clusterward4.RData")

#----= ==- - -== =----#
#-------- --- --------#

par(mfrow=c(2,4))
plot(clusterward1)
plot(clusterward2)
plot(clusterward3)
plot(clusterward4)
readline("<Enter> to continue")

#----- Plot LCP ----#
#-------------------#

## Separating 3 clusters:
cl1.3 <- cutree(clusterward1, k = 3)
cl1.3fac <- factor(cl1.3, labels = paste("Type", 1:3))

## Type membercount: (redundant, appears on plot)
#cat("Type member count:\n")
#for (i in 1:3) cat("Type",i,":",sum(!is.na(match(cl1.3,i))),"\n")
## Besser & vill mei einfach:
# table(cl1.3fac)

## Plot per type:
par(mfrow=c(2,2))
#mtext("3 Clusters", outer = TRUE, cex = 1.5)
#seqiplot(biofam.seq[,], tlim=0, group = cl1.3fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.3fac)

readline("<Enter> to continue")

## Separating 5 clusters:
cl1.5 <- cutree(clusterward1, k = 5)
cl1.5fac <- factor(cl1.5, labels = paste("Type", 1:5))

## Plot per type:
par(mfrow=c(3,2))
#seqiplot(biofam.seq[,], tlim=0, group = cl1.5fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.5fac)

rm(cl1.5fac,cl1.5,cl1.3,cl1.3fac)

#----- --- --- -----#
#-------------------#

readline("<Enter> to continue")

#---- Plot RLCP ----#
#-------------------#

## Separating 2 clusters:
cl1.2 <- cutree(clusterward2, k = 2)
cl1.2fac <- factor(cl1.2, labels = paste("Type", 1:2))

## Plot per type:
par(mfrow=c(2,2))
#seqiplot(biofam.seq[,], tlim=0, group = cl1.2fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.2fac)

readline("<Enter> to continue")

## Separating 5 clusters:
cl1.5 <- cutree(clusterward2, k = 5)
cl1.5fac <- factor(cl1.5, labels = paste("Type", 1:5))

## Plot per type:
par(mfrow=c(3,2))
#seqiplot(biofam.seq[,], tlim=0, group = cl1.5fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.5fac)

rm(cl1.5fac,cl1.5,cl1.2,cl1.2fac)

#----- --- --- -----#
#-------------------#

readline("<Enter> to continue")

#----- Plot LCS ----#
#-------------------#

## Separating 3 clusters:
cl1.3 <- cutree(clusterward3, k = 3)
cl1.3fac <- factor(cl1.3, labels = paste("Type", 1:3))

## Plot per type:
par(mfrow=c(2,2))
#seqiplot(biofam.seq[,], tlim=0, group = cl1.3fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.3fac)

readline("<Enter> to continue")

## Separating 5 clusters:
cl1.5 <- cutree(clusterward3, k = 5)
cl1.5fac <- factor(cl1.5, labels = paste("Type", 1:5))

## Plot per type:
par(mfrow=c(3,2))
#seqiplot(biofam.seq[,], tlim=0, group = cl1.5fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.5fac)

rm(cl1.5fac,cl1.5,cl1.3,cl1.3fac)

#----- --- --- -----#
#-------------------#

readline("<Enter> to continue")

#----- Plot OM -----#
#-------------------#

## Separating 3 clusters:
cl1.3 <- cutree(clusterward4, k = 3)
cl1.3fac <- factor(cl1.3, labels = paste("Type", 1:3))

## Plot per type:
par(mfrow=c(2,2))
#seqiplot(biofam.seq[,], tlim=0, group = cl1.3fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.3fac)

readline("<Enter> to continue")

## Separating 6 clusters:
cl1.6 <- cutree(clusterward4, k = 6)
cl1.6fac <- factor(cl1.6, labels = paste("Type", 1:6))

## Plot per type:
par(mfrow=c(3,2))
#seqiplot(biofam.seq[,], tlim=0, group = cl1.6fac, withlegend=F, border=NA, space=0)
#readline("<Enter> to continue")

seqdplot(biofam.seq, withlegend=F, group = cl1.6fac)
readline("<Enter> to continue")
seqHtplot(biofam.seq, group=cl1.6fac, title = "Entropy indexes")

readline("<Enter> to continue")
## Calculate some turbulence:

turb1<-seqST(seqdef(biofam.seq[cl1.6==1,]))
turb2<-seqST(seqdef(biofam.seq[cl1.6==2,]))
turb3<-seqST(seqdef(biofam.seq[cl1.6==3,]))
turb4<-seqST(seqdef(biofam.seq[cl1.6==4,]))
turb5<-seqST(seqdef(biofam.seq[cl1.6==5,]))
turb6<-seqST(seqdef(biofam.seq[cl1.6==6,]))

par(mfrow=c(3,2))


plot(density(turb1),xlim=c(0,10),ylim=c(0,0.5),main = "Sequence turbulence 1",col="blue")
plot(density(turb2),xlim=c(0,10),ylim=c(0,0.5),main = "Sequence turbulence 2",col="blue")
plot(density(turb3),xlim=c(0,10),ylim=c(0,0.5),main = "Sequence turbulence 3",col="blue")
plot(density(turb4),xlim=c(0,10),ylim=c(0,0.5),main = "Sequence turbulence 4",col="blue")
plot(density(turb5),xlim=c(0,10),ylim=c(0,0.5),main = "Sequence turbulence 5",col="blue")
plot(density(turb6),xlim=c(0,10),ylim=c(0,0.5),main = "Sequence turbulence 6",col="blue")

readline("<Enter> to continue")

hist(turb1, col = "cyan",xlim=c(1,9))
hist(turb2, col = "cyan",xlim=c(1,9))
hist(turb3, col = "cyan",xlim=c(1,9))
hist(turb4, col = "cyan",xlim=c(1,9))
hist(turb5, col = "cyan",xlim=c(1,9))
hist(turb6, col = "cyan",xlim=c(1,9))

rm(cl1.6fac,cl1.6,cl1.3,cl1.3fac,turb1,turb2,turb3,turb4,turb5,turb6)

#----- --- --- -----#
#-------------------#



readline("<Enter> to end")

# rm(clusterward1,clusterward2,clusterward3,clusterward4,biofam,biofam.seq)
graphics.off()

#detach("package:TraMineR")
#detach("package:cluster")
#setwd(initial.dir)
#rm(initial.dir)
