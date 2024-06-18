### Code for pulling data from cbioportal
#### It will also list out the clinical across datasets which
#### is how the features for the transfer model were chosen

if(!"cbioportalR"%in%installed.packages()){
  install.packages("cbioportalR")
}
library(cbioportal)

#list of studies in #cancer_source_year format
# 1 per line
#ex: prad_msk_2019
studies_to_pull<-readLines("studyList.txt") 

for(study in studies_to_pull){
  hold_study<-get_mutations_by_study(study_id=study)
  hold_clinical<-get_clinical_by_study()
  write.table(hold_study,file=paste0("./Data/",study,"_mut.tsv"),sep = "\t")
  write.table(hold_clinical,file=paste0("./Data/",study,"_clinical.tsv"),sep = "\t")
}