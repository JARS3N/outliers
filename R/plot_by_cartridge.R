plot_by_cartridge<-function(df,nameexp){
  require(ggplot2);
  require(ggthemes);
  require(dplyr)
  nRuns<-(length(unique(df$fl)))
   data<- mutate(df,ctg=paste0(Lot,"_",sn)) 
    ggplot(data,aes(grade)) +
    geom_bar(aes(fill=grade))+
    facet_wrap(~ctg)+
    ggtitle(paste0(nameexp,",n=",nRuns)) +
    theme_bw()+
    scale_fill_tableau()
}
