cat('\n entra en delete.R')
tipoErrorDelete=0
tabla<-read.table(paste0(getwd(),"/usuarios"),sep=",",header=T,stringsAsFactors = F)
tabla<-as.data.frame(tabla)
if(olduser%in%tabla$User){
  tabla<-tabla[!tabla$User%in%olduser,]
  write.table(tabla,file=paste0(getwd(),"/usuarios"),sep=",",row.names = F)
}else{
  cat("usuario no existe") 
  tipoErrorDelete=1
}
