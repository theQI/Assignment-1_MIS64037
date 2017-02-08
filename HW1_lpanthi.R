# 1. You are accessing this file from the GitHub repository.

# First, set the directory of this command to where you want to save the files. I have used my local directory. Please use your location where you want to save the files.
setwd("C:/Users/lpanthi/Google Drive/Spring 17/MIS64037/Assignment-1_MIS64037")
getwd()

# 2. The following command will download the file to the set working directory and list the files available in that directory:
fileURL <- "https://data.baltimorecity.gov/api/views/wsfq-mvij/rows.csv?accessType=DOWNLOAD"
download.file(fileURL,destfile = "CrimeData.csv",method = "auto")
list.files(".")

# The csv file contain several null values, we will now change the Null values to <NA> and save as a Crimerecord object.
CrimeRecord <- read.csv("CrimeData.csv", header = T, na.strings = c(" ", ""))
Summary(CrimeRecord)

#3. Load the libraries required to summarize data.
library("dplyr")
library("tibble")

# Saving the data to CR object in tibble format. Examples of commands that can be used in this data frame to follow.
CR <- tbl_df(CrimeRecord)
dim(CR)
summary(CR)

# There are two columns with numerical values. We will find out the mean and SD for each columns.
summarise(CR, AveragePost=mean(Post, na.rm=T), AverageIncident=mean(Total.Incidents, na.rm=T))
summarise(CR, SDPost=sd(Post, na.rm=T), SDIncident=sd(Total.Incidents, na.rm=T))

# The below command would automatically find the numerical columns and find mean and Sd respectively
sapply(CR[sapply(CR,is.numeric)],mean,na.rm=T) # Gives the means for numerical column in the DataFrame CR
sapply(CR[sapply(CR,is.numeric)],sd,na.rm=T) # Gives the standard deviation for numerical column in the DataFrame CR

# 4. To find the means and standard deviation by Crime Data group by selecting each numerical columns.
summarise(group_by(CR, CrimeCode), AveragePost = mean(Post, na.rm=T), AverageIncidents = mean(Total.Incidents, na.rm=T), SD.Post = sd(Post, na.rm=T), SD.Incidents = sd(Total.Incidents, na.rm=T))

# 5. The following commands will count the total incidents by district and crimecode
by_crimecode <- group_by(CR, CrimeCode)
by_crimecode %>% count(Total.Incidents, sort = TRUE)
by_District <- group_by(CR, District)
by_District %>% count(Total.Incidents, sort = TRUE)

# 6. Count the number of incidents in cross tabing Crimecode with Weapon and district
xtabs(Total.Incidents ~ CrimeCode+Weapon,CR) %>% ftable()
xtabs(Total.Incidents ~ CrimeCode+District,CR) %>% ftable()
