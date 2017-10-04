# Want to rewrite this using data.table instead of dplyr
grab<-function(u){
  #Import sheets from XLSX file
  X<-list(LVL=readxl::read_excel(u,sheet=find_levels(u)) ,
          AC=readxl::read_excel(u,sheet='Assay Configuration'))
  # O2 Outliers
  O2 <-select(X$LVL,O2=contains("O2 (mmHg)" ),Well) %>%
    mutate(.,O2dif=abs(O2-152))  %>%
    group_by(.,Well) %>%
    filter(.,O2dif==max(O2dif)) %>%
    slice(.,1) %>%
    ungroup(.) %>%
    rename(.,mxO2=O2dif) %>%
    mutate(.,grade=grade_ox(mxO2))
  #pH Outliers
  pH<-select(X$LVL,Well,pH) %>%
    mutate(.,pHdif=abs(pH-7.4))  %>%
    group_by(.,Well) %>%
    filter(.,pHdif==max(pHdif)) %>%
    slice(.,1) %>%
    ungroup(.)%>%
    mutate(.,gradepH=grade_ph(pHdif))

  # Tick zero median

  T0 <-  select(X$LVL,O2=contains("O2 (mmHg)" ),Well,Tick) %>%
    filter(.,Tick==min(Tick)) %>%
    summarize(med=median(O2))
  # Final merged output
  Meta <-setNames(unlist(X$AC[,2]),unlist(X$AC[,1]))

  MedianFirstTick = T0$med
  metainfo <-data.frame(
    sn=Meta["Cartridge Serial"],
    Lot=Meta["Cartridge Lot"] ,
    Instrument=Meta["Instrument Serial"],
    fl=u,
    MedianFirstTick = T0$med
  )

  merge(O2,pH,by='Well') %>%
    mutate(.,fl=u) %>%
    merge(.,metainfo,by='fl')
}
