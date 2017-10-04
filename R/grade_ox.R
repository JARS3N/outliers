grade_ox<-Vectorize(function(u){c("A","B","C","D")[c(u < 5,u >=5 & u <10,u >=10 & u <20,u >= 20)]})
