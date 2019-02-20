grade_ox<-Vectorize(function(u){(c("D","C","B","A")[u >=c(20,10,5,0)])[1]})
