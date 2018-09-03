cat('\n entra en login.R')


tipoErrorLogin=0
tabla<-read.table(paste0(getwd(),"/usuarios"),sep=",",header=T,stringsAsFactors = F)
tabla<-as.data.frame(tabla)
tabla_users<-read.table(paste0(getwd(),"/users"),sep = ",",header=T,stringsAsFactors = F)
tabla_users<-as.data.frame(tabla_users)
if(user%in%tabla$User || user%in%tabla_users$User){
  if(password==tabla$Password[tabla$User%in%user] || password==tabla_users$Password[tabla_users$User%in%user]){
    loginCorrect=TRUE
    if(tabla$Type[tabla$User%in%user]=="Admin" || tabla_users$Type[tabla_users$User%in%user]=="Admin"){
      UserAdmin=TRUE
    }
  }else{
    tipoErrorLogin=2
    cat("\nWrong password")
  }
}else{
  cat("\nThe user doesn't exist")
  tipoErrorLogin=1
}
  
