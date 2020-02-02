# partial_pressure_ox<-Vectorize(function(TC,atm=760){
#   HC<-function(TC){(-0.0000058333*TC^3+0.0001821*TC^2+0.072405*TC+2.5443)*10000}
#   vp<-function(TC){0.0456*TC^2-0.8559*TC+16.509}
#   DO<-function(TC,vp,ap=atm){
#     if(TC>=0 & TC<30){coef<-.678;adj<-35}else{if(TC>=30 & TC<=50){coef<-.827;adj<-49}}
#     ((ap-vp)*coef)/(adj+TC)
#   }
#   DO(TC,vp(TC),atm)*(1/1000)*(1/32)*(18/1000)*HC(TC)*atm
# })
partial_pressure_ox <- Vectorize(function(TC, atm = 760) {
  i <- (TC >= 30) + 1
  coef <- c(0.678, 0.827)[i]
  adj <- c(35, 49)[i]
  0.005625 * (-0.0000058333 * TC ^ 3 + 0.0001821 * TC ^ 2 + 0.072405 * TC + 2.5443) * atm * 
    (atm - (0.0456 * TC ^ 2 - 0.8559 * TC + 16.509)) * coef * (adj + TC)^-1
})
