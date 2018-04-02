collect_asyr_qc<-function(dir=choose.dir()){
  require(dplyr)
    lapply(list.files(dir,pattern="asyr$",full.names=T),XML::xmlTreeParse,useInternalNodes=T)%>%
    lapply(.,munge_inst_qc) %>%
    bind_rows()
}
