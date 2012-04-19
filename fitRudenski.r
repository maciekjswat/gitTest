
fitRudenski <- function(inputList) {

	scriptName <- "fitRudenski.r"
	plotInfo <- "Rudenski"
	author <- "MJS"
	footnote <- paste(plotInfo,scriptName, format(Sys.time(), "%d %b %Y"),
					  author, sep=" / ")
	
	mydata <- read.csv("Rudenski1991_Glu_Ins_Baselines.csv", header = TRUE, sep = ",")
#plot(mydata,main<-inputList$title)


#plotdist(mydata[,4],breaks=25)
	
	descdist(mydata[,4], boot = 1000)
	
	makeFootnote(footnote)
}