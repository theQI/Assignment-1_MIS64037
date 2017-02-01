#This R program will give output for the desired results as per 

#We will download the crime data from the baltimore city website with the below function.
fileURL <- "https://data.baltimorecity.gov/api/views/wsfq-mvij/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile = "CrimeData.csv",method = "auto")
list.files(".")
# The csv contains both NULL values and privacysuppressed designations in numeric fields
CrimeRecord <- read.csv("CrimeData.csv", header = T, na.strings = c(" ", ""))
library(tibble)
CR 
