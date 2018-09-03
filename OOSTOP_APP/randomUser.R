
userID<-paste0("user",as.character(round(abs(rnorm(1))*10000000000000)))
assign(userID,new.env())
assign("nombreEntorno",userID , envir = get(userID))
