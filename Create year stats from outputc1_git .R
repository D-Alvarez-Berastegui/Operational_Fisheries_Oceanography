
# Open file created in code 1 with the daily SST, get year stats
# input file: table created from  Operational_Fisheries_Oceanography/1_download nc and process_daily_data_from_Copernicus_MFS_GIT
# output file: table with year stats


rm(list=ls(all=TRUE))

# red table with daily data, use the filename of the previous code 1 you specified in:
# Operational_Fisheries_Oceanography/1_download nc and process_daily_data_from_Copernicus_MFS_GIT 


t0=read.table(filename, dec = ".", sep=";",header=T) 
t0[t0==-999]=NA
nrow(t0)
head(t0)
unique(t0)


t0[t0==-999]=NA
nrow(t0)
head(t0)

names(t0)

t1=unique(t0)

tapply(t1, t1$year, length)

t1$year=as.numeric(format(as.Date(t1$mydate),'%Y'))
t1$month=as.numeric(format(as.Date(t1$mydate),'%m'))

tapply(t1$year, t1$year, length)
tapply(t1$meansst, t1$year, mean)



boxplot(t1$meansst~t1$year,col="grey85")


tapply(t1$meansst,t1$year,mean,na.rm=T)
tabla= aggregate(t1$meansst, list(t1$year), mean,na.rm=T);tabla
fix(tabla)



t2=t1[t1$month==5 |t1$month==6 |t1$month==7  |t1$month==8,] 

tapply(t2$year, t2$year, length)



boxplot(t2$meansst~t2$year,col="grey83")

tabla2= aggregate(t2$meansst, list(t2$year), mean,na.rm=T);tabla
names(tabla2)=c("year","mean_SST")
tabla2$sd= aggregate(t2$meansst, list(t2$year), sd,na.rm=T)[,2]
tabla2$nsamples= aggregate(t2$meansst, list(t2$year), length)[,2]
tabla2$sem<-tabla2$sd/sqrt(tabla2$nsamples)

tabla2


# specify here the output name of your filename

outputfilenamec2= "myoutputfilename"


# export table

write.table(tabla2,outputfilenamec2, quote = FALSE, dec = ".", sep=";",row.names=FALSE) 




