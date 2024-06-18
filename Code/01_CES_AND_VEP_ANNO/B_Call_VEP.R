#from a the directory where A_maf-to-vcf was run
#gets uses vep to annotate SIFT 
#requires an annotation vcf to run

#will need to be updated with path to local annotation vcf
anno<-"homo_sapiens_GRCh38.vcf"


sdir<-getwd()
dir_list<-list.dirs()
for(i in dir_list){
  setwd(i)
  thisVCF<-list.files()[1]
  toRun<-paste0("./vep -i ",anno," --cache --force_overwrite --sift b --polyphen b")
  system(toRun)
  setwd(sdir)
}