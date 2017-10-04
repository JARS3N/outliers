collect_qc<-function(dir=choose.dir()){
  require(dplyr)
  list.files(dir,pattern="xls",full.names=T) %>%
    lapply(.,munge_qc)%>%
    bind_rows()
}
