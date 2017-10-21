
install.packages("popbio")

library(popbio) 


A<-matrix(c(0.119,0.119,0.119,0.119,0.13,0.60,0.17,0.14,0,0.07,0.33,0.29,0,0,0.08,0.43),nrow=4,byrow=TRUE)
n<-c(8,15,12,7)
n2<-c(6,14,6,4)


lambda(A)
res<-pop.projection(A,n,iterations=20)

plot(res$pop.sizes,type="l",col="black",ylab="Number of nests",xlab="Number of years from 2015")
points(res$stage.vectors[1,],type="l",ylim=c(0,25), col="yellow", xlab = "Time", ylab = "Number of Individuals")
points(res$stage.vectors[2,],type="l",ylim=c(0,300),col="red", xlab = "Time", ylab = "Number of Individuals")
points(res$stage.vectors[3,],type="l",ylim=c(0,300),col="green", xlab = "Time", ylab = "Number of Individuals")
points(res$stage.vectors[4,],type="l",ylim=c(0,300),col="dark blue", xlab = "Time", ylab = "Number of Individuals")
legend("topright",title = "Size classes", c("All","0-50cm","50-100cm","100-150cm",">150cm"),lty = c(1,1),lwd = c(2.5,2.5,2.5,2.5),col=c("black","yellow","red","green","dark blue") )

?points




?legend
?text.font







