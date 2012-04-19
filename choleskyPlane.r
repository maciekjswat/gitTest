rm(list=ls())

lenSeq = 61
boxSize <- 3.5
sequence <- seq(-boxSize,boxSize,len=lenSeq)

minX = -boxSize; maxX = boxSize+0.1*boxSize;
minY = -boxSize; maxY = boxSize+0.1*boxSize;

nParams <- 2
nObserv <- lenSeq*lenSeq
rho <- 0.8
M <- array(rho, dim = c(nParams, nParams))
diag(M) <- 1

## compute Cholesky factor
cF <- chol(M) # [1,] 1  0.8 [2,] 0  0.6
tcF <- t(cF)  # print(cF)

k = 0;
nonCorr <- matrix(0,nrow=lenSeq*lenSeq,ncol=2)
for (i in 1:lenSeq) {
    for (j in 1:lenSeq) {
      k=k+1
      nonCorr[k,1] = sequence[i]
      nonCorr[k,2] = sequence[j]
    }
}

corrArray <- nonCorr %*% cF    #print(cor(nonCorr)) #print(cor(corrArray))
print(corrArray)

dotSizeArray <- abs(corrArray[,2] - nonCorr[,2])
print('dotSizeArray'); print(dotSizeArray)

# calculate color index, colorIndex = 0:255
colorIndex <- ceiling((dotSizeArray)/max(dotSizeArray)*255)
colorIndex[colorIndex==0] <- 1
print('colorIndex'); print(colorIndex)

colorIndexMatrix <- matrix(colorIndex,ncol=lenSeq)
print('colorIndexMatrix'); print(colorIndexMatrix)

rgb.palette <- colorRampPalette(c("blue", "darkgreen", "orange", "red"), space = "rgb")
blub <- rgb.palette(255)

par(mar=c(3,3,1.5,0.5), oma=c(0,0,0,0), mgp=c(2,1,0))
par(mfrow = c(1, 1))
plot(c(minX:maxX),c(minY:maxY),type="l",lty=5,lwd=3,xlab='first column',ylab='second column')
for (i in 1:lenSeq) {
  for (j in 1:lenSeq) {
    points(sequence[i],sequence[j],col=blub[colorIndexMatrix[j,i]],pch=15,cex=2)
  }
}

source('/Users/mjswat/Projects/distros/choleskyFun.R')
choleskyFun(nParams,150,rho)

lines(c(minX:maxX),c(minY:maxY),type="l",lty=5,lwd=3)
grid(nx = NULL,ny = NULL,col = "black",lty = "dotted",lwd = par("lwd"),equilogs = TRUE)
title(paste('correlation coeff rho=',rho))

#source('/Users/mjswat/Projects/distros/choleskyTest.R')
