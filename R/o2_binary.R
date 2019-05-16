o2_binary<-Vectorize(function(x){
OLG<-list2env(setNames(list(F,F,T,T),c("A","B","C","D")))
OLG[[x]]
})
