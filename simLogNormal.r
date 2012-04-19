
simLogNormal <- function(inputList) {

	scriptName <- "simLogNormal.r"
	plotInfo <- "simLogNormal"
	author <- "MJS"
	footnote <- paste(plotInfo,scriptName, format(Sys.time(), "%d %b %Y"),
					  author, sep=" / ")

	
	blub <- rlnorm(1000, 2.18, 0.75)
	
	print(summary(log(blub)))
	

	plotdist(blub,breaks=75)
	
	hist(blub,breaks=50,xlim=c(0,80))
		
	makeFootnote(footnote)
}

rlnorm0 <- function(inputList) {

	print(inputList)

	sigma <- sqrt(log(inputList$CV^2 + 1))
	mu <- log(inputList$mean) - (sigma^2)/2
	print(tail(rlnorm(inputList$n, mu, sigma)))
}
