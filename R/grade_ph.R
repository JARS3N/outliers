grade_ph<-Vectorize(function(u){
c(c("D","C","B","A")[u>=c(0.4,0.2,0.1,0)])[1]
})
