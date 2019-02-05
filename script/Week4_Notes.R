#intro to DataFrames
download.file (url = "https://ndownloader.figshare.com/files/2292169", destfile = "data/portal_data_joined.csv")
read.csv(file = "data/portal_data_joined.csv")
surveys <-read.csv(file = "data/portal_data_joined.csv")
surveys
head()
head(surveys)
str(surveys)
survey
dim(surveys)
nrow(surveys)
ncol(surveys)
tail(surveys)
#other useful fxns
names(surveys)
#think in R's terms...what type of return do you get for various commands
rownames(surveys)
#another useful one
summary(surveys)
#this command computes simple summary stats on each column. Gives you a way to check parameters of data...date ranges, etc. how many. Can see if there's anything off with data set..obvious mistakes, data dictionaries, unassigned designations e.g. an infividual's sex left with a space... Shows you if not consistent in data collection/data dictionaries E.g., Sex M, F ___ (blank instead of NA)
#subsetting dataframes
animal_vec <-c("fox", "bat", "shrew")
animal_vec [2]
#dataframes are 2D. Numbers indicate coordinates in a 2D grid; Row, Column    Basically an X Y coordinate system.  There's a function calld "subset" 
surveys [1,1]
head(surveys)
surveys[2,1]
surveys[33000,1]
#whole first column: indicate this in the row designation --leave it blank to return ALL
surveys[,1]
#note that the ouput is a vector.  Using bracket notation gives us whole first column as vector
surveys [1]
head(surveys[1])
#Using a single number with no comma will give a dataframe with one column. Imagine we wanted to pull out one column of data and feed it into a fxn that can only take vectors. This single-number-no-comma feature is NOT the same. Recognize that this result gives a dataframe not a vector
#to get specified range of data return, use range e.g., 1:3
surveys[1:3,7]
surveys[1:3,6]
#can request multiple entries, like 1st and 3rd:
animal_vec[c(1,3)]
1:3
3:20
#we can put vectors into brackets and get segments back: subsetting options very useful
#this pulled out first 3 values in 6th column
surveys[1:3,6]
#what if we want to pull out an entire single observation's data, e.g., whole 5th row:
surveys[5,]
#note that the result is a dataframe
#  Q: how do we recognize dataframe from vector? column headers included in dataframe?  ***If not sure, use "str" to find out the structure of your data*****
#negative sign to exclude indices
surveys[1:5,-1]
#get rid of everything but the first 10
surveys[-10:34786]
#R doesn't like making vectors with negative subscripts past 0
-10:0
-10:1
-10:20
#but doesn't work in format in brackets??
surveys[-c(10:34786),]
surveys[10,15,20,]
surveys[c(10,15,20,10),]
surveys[c(1,1,1,1,1),]
#more ways to subset...again, using square brackets, can ask for columns by column name
names(surveys)
surveys ["plot_id"] #single column as data frame
surveys[,"plot_id"] #single column as vector
surveys[["plot_id"]] #single column as a vector--we'll come back to double brackets later. Analogy of train with multiple cars. Each car is a column. Using a single square bracket and asking for X will give you the entire train car X. Double brackets give you what is inside the train carX. Basically -- nesting function
#the double brackets come into play a lot when you're dealing with lists. Lists are powerful, flexible (and often frustrating)
surveys$year  #single column as vector  Using dollar sign, you need to indicate the exact name of the column (rather than the location by numerical order)    lets you explore inside your dataframe
str(surveys)
surveys_200<-surveys[200,]
surveys_200
nrow(surveys_200)
#challenge create a dataframe surveys_200
#my first step was correct. nrow to get last row....
surveys[nrow(surveys),]
tail(surveys)
surveys_last<-surveys[nrow(surveys),]
surveys_middle<-surveys[nrow(surveys)/2,]
surveys_middle
surveys[7:nrow(surveys),]
#combine nrow() with the - notation above to reproduce the behavior of head(surveys), keeping just the first through 6th row of the surveys dataset
surveys[-c(7:nrow(surveys)),]
#finally, factors....
surveys$sex
#by default htese are alphabetical.
#creating our own factor
sex<-factor(c("male", "female", "male", "female"))
sex
class(sex)
typeof(sex)
#above shows difference between "typeof" and "class"
level(sex)
levels(sex)
levels(surveys$genus)
nlevels(sex)
concentration <- factor (c("high", "medium", "high", "low"))
concentration
concentration <- factor(concentration, levels = c ("low", "medium", "high"))
concentration
#let's try adding to a factor
concentration <-c(concentration, "very high")
concentration
#R coerces to characters if you add a value that doesn't match a current level.  e.g., doesn't accept the change made above to levels so converted everything to characters
#lets just make them characters
as.character (sex)
#factors with numeric levels
year_factor<-factor(c(1990, 1923, 1965, 2018))
#the above set of values are stored as level integers by R. The "labels" in this case years, are not returned
as.numeric (year_factor)
as.character (year_factor)
#this will actually give us a numeric vector
as.numeric (as.character (year_factor))
#recommended way to do above:
as.numeric(levels(year_factor))
#and can subset vectors, repeat values, put in any order...
as.numeric(levels(year_factor)) [year_factor]
#QUESTION: What is a factor??  When do you use factors? What are factors for? Utility and application?  How different from other named things we've assigned.

#people move back and forth between character and factor frequently so ....
#why all these factors??   read.csv has a controversial default
#in read.csv, it will take any character strings it finds and turns it into factors. so...
surveys_no_factos <-read.csv(file = "data/portal_data_joined.csv", stringsAsFactors=FALSE)
# renaming factors
sex<-surveys$sex
levels(sex)
levels(sex)[1]<-"undetermined"
levels(sex)
head(sex)                             
#QUESTION.  This session was too fast for me, without any sense of application or context. There was more about dates "lubridate" but I got lost some time ago -- I have no scaffolding to make sense of any of this; it's just a long list of functions I am dutifully typing without any comprehension..
#working with dates
library (lubridate)
# need a particular package
my_date <- ymd("2015-01-01")
my_date
str(my_date)
#He kept teaching more date stuff but I had to leave to make a conference call.

