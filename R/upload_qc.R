upload_qc<-function(){
  DATA<-outliers::collect_qc()
  require(RMySQL)
  db<-adminKraken::con_mysql()
  dbWriteTable(db, name="inst_qc_ol",value=DATA,
               append=TRUE,overwrite = FALSE,row.names=FALSE)
  dbDisconnect(db)
}
