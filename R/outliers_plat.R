plat<-function (Instrument) 
{
  Instrument<-as.numeric(Instrument)
  s1 <- as.character(substr(Instrument, 1, 1))
  s2 <- as.character(substr(Instrument, 2, 2))
  if (s1 == "2") {
    return("XF96")
  }
  else {
    return(c("XFe96", "XFe24", "XFp","HS Mini","XFpro96")[as.numeric(s2)])
  }
}
