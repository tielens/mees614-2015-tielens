
# load libraries
library(raster)

# make empty landscape. 0 = dead cells, 1 = live cells
rast <- raster(matrix(0,100,100))

# make some cells live
rast[50, 50] <- 1 
rast[51, 50] <- 1
rast[50, 51] <- 1
rast[51, 51] <- 1

#or rast[c(50,51,50,51),c(50,50,51,51)] <-1
par(mfrow=c(1,1))
plot(rast)
?raster

# who is next to whom? see ?adjacent (raster)
# we need to figure out a way to know who is a one (1).
# so if use getValues, we will get a vector of zeros and ones
# using which and == we can find which cell numbers have ones (1)
# adjacent gets you all the 8 cells adjacent. In this case we are getting the ones equal to one. 

live <- adjacent(rast, cells = which(getValues(rast)==1), directions=8) 

#so we want to count the number of live cells adjacent to all live cells.  Table is a really nice function for this
#the space between the table() is counting how many have living neighbors in column 2


liveTab <- as.data.frame(table(live[,2]), stringsAsFactors=F)
#when you turn into a data frame that is what is getting you the frequency of each cell variation in columb 2 (can anyone say that more eloquently?)

#Tricky spot - need to convert Var1 to numeric to avoid trouble later
#We can discuss why in class
liveTab$Var1 <- as.numeric(liveTab$Var1)

l<-as.data.frame(table(live[ ,2]))

for (i in 1:length(liveTab$Var1)){
  if (liveTab$Var1[i]>2){
    rast[i]=1
  } 
  else if(liveTab$Var1[i]<2){ rast[1]=0}
iter[i]=100}
plot(rast)

