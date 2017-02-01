#This R program will give output for the desired results as per 
#Setting the working directory first
setwd("C:/Users/laxpa/Google Drive/Spring 17/MIS64037/Assignment-1_MIS64037")
#We will download the crime data from the baltimore city website with the below function
fileURL <- "https://data.baltimorecity.gov/api/views/wsfq-mvij/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile = "CrimeData.csv",method = "auto")
list.files(".")
# The csv contains both NULL values and privacysuppressed designations in numeric fields
CrimeRecord <- read.csv("CrimeData.csv", header = T, na.strings = c(" ", ""))
CrimeRecord
library("dplyr", lib.loc="~/R/win-library/3.3")
library("tibble", lib.loc="~/R/win-library/3.3")
CR <- tbl_df(CrimeRecord)
dim(CR)
summarise(CR, AveragePost=mean(Post, na.rm=T))
by_crimecode <- group_by(CR, CrimeCode)
by_crimecode
summarise(by_crimecode, AveragePostbyCrimeCode = mean(Post, na.rm=T))