O2_outliers<-function(X){
require(dplyr)
  O2 <-select(X$LVL,O2=mmHgO2,Well) %>%
    mutate(.,mxO2=abs(O2-151.69))  %>%
    group_by(.,Well) %>%
    filter(.,mxO2==max(mxO2)) %>%
    slice(.,1) %>% 
    ungroup(.) %>%
    mutate(.,grade=outliers::grade_ox(mxO2)) 
 meta<-data.frame(
    sn=X$sn,
    Lot=X$Lot,
    Instrument=X$Inst,
    fl=X$file
  )
    merge(O2,meta)
}
