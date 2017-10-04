munge_qc<-function(u=file.choose()){
  require(dplyr)
  X <- list(LVL = readxl::read_excel(u, sheet = find_levels(u)),
            AC = readxl::read_excel(u, sheet = "Assay Configuration"))
  Meta<-setNames(unlist(X$AC[,2]),unlist(X$AC[,1]))
  metainfo <- data.frame(sn = Meta["Cartridge Serial"],
                         Lot = paste0(Meta["Cartridge Type"],
                                      Meta["Cartridge Lot"]),
                         Instrument = Meta["Instrument Serial"],
                         fl = basename(u),
                         platform=.Plat(Meta["Instrument Serial"]),
                         stringsAsFactors = FALSE)
  select(X$LVL, O2 = contains("O2 (mmHg)"), Well,
         WellTemp=`Well Temperature`) %>%
    mutate(., O2dif = abs(O2 - 152)) %>%
    mutate(OL= O2dif>10) %>%
    group_by(Well) %>%
    filter(., O2dif == max(O2dif)) %>%
    slice(., 1) %>% ungroup(.) %>%
    mutate(.,grade=sapply(O2dif,grade_ox)) %>%
    merge(.,metainfo)
}

