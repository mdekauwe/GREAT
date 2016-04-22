#-------------------------------------------------------------------------------------------------
#- plot a conceptual model of "one curve" vs. "different curves"
#-------------------------------------------------------------------------------------------------

predJune <- function(Tleaf=10,Topt=20,Jref=1,omega=5){
  yval <- Jref*exp(-1*((Tleaf-Topt)/omega)^2)
}

#- plot three curves
Tleaf <- seq(15,40,length=101)
a <- predJune(Tleaf=Tleaf,Topt=20,Jref=1,omega=5)
b <- predJune(Tleaf=Tleaf,Topt=25,Jref=1,omega=5)
c <- predJune(Tleaf=Tleaf,Topt=30,Jref=1,omega=5)


#- plot common curves
a2 <- predJune(Tleaf=Tleaf,Topt=25.3,Jref=1,omega=15)
b2 <- predJune(Tleaf=Tleaf,Topt=24.7,Jref=1,omega=15)
c2 <- predJune(Tleaf=Tleaf,Topt=25,Jref=1,omega=15)


palette(rev(brewer.pal(6,"Spectral")))
COL=palette()[c(1,2,6)]
linewidth=3

windows(35,20);par(mfrow=c(1,2),mar=c(4,4,1,1),oma=c(4,4,0,0))
plot(a~Tleaf,type="l",col=COL[1],lwd=linewidth,xlab="",ylab="",axes=F)
lines(b~Tleaf,type="l",col=COL[2],lwd=linewidth,xlab="",ylab="",axes=F)
lines(c~Tleaf,type="l",col=COL[3],lwd=linewidth,xlab="",ylab="",axes=F)
magaxis(side=c(1,2),labels=c(1,1),frame.plot=T,las=1,cex.axis=1.5)
legend("topright",letters[1],bty="n",cex=1.5)

plot(a2~Tleaf,type="l",col=COL[1],lwd=linewidth,xlab="",ylab="",axes=F)
lines(b2~Tleaf,type="l",col=COL[2],lwd=linewidth,xlab="",ylab="",axes=F)
lines(c2~Tleaf,type="l",col=COL[3],lwd=linewidth,xlab="",ylab="",axes=F)
magaxis(side=c(1,2),labels=c(1,1),frame.plot=T,las=1,cex.axis=1.5)
legend("topright",letters[2],bty="n",cex=1.5)

title(xlab=expression(Temperature~(degree*C)),outer=T,cex.lab=3,line=2)
title(ylab="Growth (normalized)",outer=T,cex.lab=3,line=1)
dev.copy2pdf(file="output/conceptualfigure.pdf")