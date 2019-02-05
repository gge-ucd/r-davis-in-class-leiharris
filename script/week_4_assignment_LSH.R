read.csv(file = "data/portal_data_joined.csv")
surveys <-read.csv(file = "data/portal_data_joined.csv")
surveys[c(1:400),c(1,5:8)]
surveys_subset<-data.frame(surveys[c(1:400),c(1,5:8)])
surveys_subset
surveys_Long_Feet <- subset(surveys_subset, hindfoot_length > 32)
hist(surveys_Long_Feet[,5])