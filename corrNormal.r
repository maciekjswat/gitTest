
corrNormal <- function(inputList) {

	scriptName <- "corrNormal.r"
	plotInfo <- "corrNormal"
	author <- "MJS"
	footnote <- paste(plotInfo,scriptName, format(Sys.time(), "%d %b %Y"),
					  author, sep=" / ")
	
	sigma <- matrix(c(1,0.8,0.8,1), ncol=2)
	x <- rmvnorm(n=500, mean=c(1,2), sigma=sigma, method="chol")
	pairs(x)

	# Sample from Bivariate Normal
	z<-mvrnorm(n=100, p=2, u=c(100,100), s=c(35,35), S=matrix(c(1, .9, .9, 1), ncol=2, nrow=2,byrow=T))
	pairs(z)
	
#hist(x[,2],breaks=50)
		
	makeFootnote(footnote)
}

mvrnorm <- function(n, p, u, s, S) {
	Z <- matrix(rnorm(n*p), p, n)
	
	t(u + s*t(chol(S))%*% Z)
}

