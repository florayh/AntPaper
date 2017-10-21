install.packages(c('spatstat','sp','rgeos'))
library(sp)        #spatial analysis package
library(spatstat)  #spatial analysis package
library(maptools)  #package required for converting between sp and spatstat formats
library(rgdal)     #package needed for loading shapefiles


setwd("/Users/Flora/Desktop/Week3Ants/RWorking2")
getwd()

### Data setup
nests.data<-readOGR(".","Nests2015")          #load the nest points shapefile
field.data<-readOGR(".","FieldBoundary")      #load the field outline

names(nests.data)     #DIAMETER_1 = diameter in 2013; DIAMETER_2 = diam.2015; Status_201=status in 2013, etc.

nests.2013<-nests.data[nests.data$Status_201=="Alive",]     #Extract live 2015 nests

pppnests<-as.ppp(nests.2013)                           #convert to "ppp" format (required to run Ripley's K)
pppnests$window<-as(field.data,"owin")                 #Define the "window"
pppnests<-unmark(pppnests)                             #remove extraneous data

### Data analysis (Ripley's K)
r=c(0:25)     #define the distances at which to calculate Ripley's K statistic
nestsK<-envelope(pppnests,              #create an 'envelope' that compares...
                 Kest,                  #...the K statistic
                 r=r,                   #...at distances of r
                 correction="iso",      #...with edge correction
                 nrank=25,              #...at 95% confidence interval (drop 25 most extreme values on both ends)
                 nsim=1000)             #...to 1000 random simulations

plot(nestsK)    #look at the results

plot(pppnests)
gpclibPermit()
