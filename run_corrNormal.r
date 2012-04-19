
rm(list=ls())

inputList <- list(
	title = 'some title',
	n = 1e6,
	CV = 40,
	mean = 250

)

source("corrNormal.r")
source("makeFootnote.r")

corrNormal(inputList)
