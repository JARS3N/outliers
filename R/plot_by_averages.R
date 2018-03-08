plot_by_averages <-function(df,nameexp){
  require(ggplot2);
  require(ggthemes);
  nWells<-length(unique(df$Well))
  nRuns<-(length(unique(df$fl)))

    
 #   data<-summarize(
 #     group_by(df,grade),
 #             peraverage=round(n()/(nRuns* nWells)*100,3)
 #   ) 
  
data<-do.call('rbind',
  Map(function(x,y){
    data.frame(grade=y,n=nrow(x))
  },
  x=split(df,df$grade),
  y=names(split(df,df$grade))
  )
)
data$peraverage<-round(n_table$n/(sum(n_table$n))*100,3)
  
  
  
  
  
    ggplot(data,aes(grade,peraverage)) +
    geom_bar(aes(fill=grade),stat='identity')+
    theme_bw()+
    scale_fill_tableau()+
    geom_text(aes(label =paste0(round(peraverage,3),"%"),
                  x = grade, y = peraverage),
              position = position_dodge(width = 0.8), vjust = -0.6)+
    ggtitle(paste0(nameexp,",n=",nRuns))
}
