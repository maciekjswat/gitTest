
rm(list=ls())

inputList <- list(
	title = 'some title'
)

source("simLogitNormal.r")
source("makeFootnote.r")

library(fitdistrplus)


simLogitNormal(inputList)

