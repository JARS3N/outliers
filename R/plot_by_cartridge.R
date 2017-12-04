plot_by_cartridge<-function(df,nameexp){
  require(ggplot2);
  require(ggthemes);
  nRuns<-(length(unique(df$fl)))
  df$ctg<-paste0(df$Lot,"_",data$sn)
    ggplot(df,aes(grade)) +
    geom_bar(aes(fill=grade))+
    facet_wrap(~ctg)+
    ggtitle(paste0(nameexp,",n=",nRuns)) +
    theme_bw()+
    scale_fill_tableau()
}
