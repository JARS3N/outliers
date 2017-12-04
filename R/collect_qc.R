collect_qc<-function(dir=choose.dir()){
  require(dplyr)
    lapply(list.files(dir,pattern="xls",full.names=T),munge_qc)%>%
    bind_rows()
}
