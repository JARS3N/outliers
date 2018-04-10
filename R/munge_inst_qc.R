## this follows asyr::parse
munge_inst_qc<-function(u){
  require(dplyr)
select(u$LVL,Well,mmHgO2,fl=file) %>% 
group_by(Well) %>% 
mutate(O2dif=abs(152-mmHgO2)) %>% 
filter(.,O2dif==max(O2dif)) %>% 
slice(.,1) %>% 
  mutate(
    OL = O2dif > 10,
    Instrument = u$Inst,
    sn = u$sn,
    Lot = u$Lot,
    grade = outliers::grade_ox(O2dif),
    platform=outliers::plat(Instrument)
  )
}
