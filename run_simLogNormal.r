
rm(list=ls())

inputList <- list(
	title = 'some title',
	n = 1e6,
	CV = 40,
	mean = 250

)

source("simLogNormal.r")
source("makeFootnote.r")

library(fitdistrplus)


simLogNormal(inputList)
rlnorm0(inputList)
