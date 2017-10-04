grade_ph<-Vectorize(function(u){
  c("A", "B", "C", "D")[c(u < 0.1, u >= 0.1 & u <= 0.2, u > 0.2 & u <= 0.4, u > 0.4)]
})
