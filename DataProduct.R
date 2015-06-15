library(ggplot2)
data(mtcars)
attach(mtcars)

mtcars$cyl  <- factor(mtcars$cyl)
mtcars$vs   <- factor(mtcars$vs)
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)
mtcars$am   <- factor(mtcars$am,labels=c("Auto","Manual"))

allModel<-lm(mpg ~ .,data=mtcars)
filtModel<-step(allModel,direction="both")

buildPlot<-function(cyl,hp,startWt,endWt,step,transType){
  data<-data.frame(cyl,hp,startWt,transType)
  nextWt<-startWt+step
  
  while (nextWt<=endWt)
  {
    addData<-c(cyl,hp,nextWt,transType)
    
    data<-rbind(data,addData)
    nextWt<-nextWt+step
  }
  names(data)<-c("cyl","hp","wt","am")
  data$cyl<-as.factor(data$cyl)
  data$am<-as.factor(data$am)
  data$hp<-as.numeric(data$hp)
  data$wt<-as.numeric(data$wt)
  
  plot(data$wt,predict(filtModel,data),xlab="Car Weight (lb/1000)",ylab="Estimated MPG",type="o",col="blue")
}
