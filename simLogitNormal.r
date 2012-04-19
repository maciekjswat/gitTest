
simLogitNormal <- function(inputList) {

	scriptName <- "simLogitNormal.r"
	plotInfo <- "simLogitNormal"
	author <- "MJS"
	footnote <- paste(plotInfo,scriptName, format(Sys.time(), "%d %b %Y"),
					  author, sep=" / ")

	
	blub <- rlnorm(1000, mean=2.18, sd=0.75)
	
	print(summary(log(blub)))
	

	plotdist(blub,breaks=75)
	
	hist(blub,breaks=50,xlim=c(0,80))
		
	makeFootnote(footnote)
}