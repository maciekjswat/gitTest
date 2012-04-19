
rm(list=ls())

inputList <- list(
	title = 'some title'
)

source("fitRudenski.r")
source("makeFootnote.r")

library(fitdistrplus)


fitRudenski(inputList)

