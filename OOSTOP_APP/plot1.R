library(ncdf4)
library(RNetCDF)
library(raster)
library(maptools)
library(dismo)
library(fields)

nc=nc_open('2013-05-01_vosaline.nc')
lat = ncvar_get( nc, "lat")          # coordinate variable
lon = ncvar_get( nc, "lon")          # coordinate variable
time=ncvar_get( nc, "time")
var = names(nc$var)
# chla = var.get.nc( nc,"so",start=c(1,1,1), count=c(length(lon),length(lat),1))   # variabl
salinity = ncvar_get(nc,"so",start=c(1,1,1,1), count=c(length(lon),length(lat),1,1))
salinity2<-as.data.frame(salinity)
#construct a transposed 2D matrix with data to plot. This command is a key to create a format that the library raster can read correctly.
m2 <- t(salinity)[nrow(t(salinity)):1,]
#create a raster object with the 2D matrix and give it the projection information

r <- raster(m2, xmn=min(lon), xmx=max(lon), ymn=min(lat),ymx=max(lat),crs="+proj=longlat +datum=WGS84")
coastline <- readShapePoly("country.shp")
plot(r,col=tim.colors(64))
lines(coastline,add=T)

r2=log(r)
plot(r2,col=tim.colors(64))
lines(coastline,add=T)


xmax=10
xmin=-6
ymax=45
ymin=34

e <- extent(xmin, xmax,ymin,ymax)
rc <- crop(r, e)


logr=log(rc)


plot(logr,useRaster=TRUE,xlim=range(-6,10),ylim=range(34,45), col=tim.colors(64), axes=TRUE,legend=FALSE, las=0.1)
plot(coastline,border="blue",col="gray",add=TRUE)
ntics=5
r2.range=c(minValue(logr), maxValue(logr))
labelplaces=seq(r2.range[1], r2.range[2],length.out=ntics)
labelplaces[1]=labelplaces[1]+0.5# para que entre dentro del rango
labelplaces[ntics]=labelplaces[ntics]-0.1 # para que entre dentro del rango
labelvals <- round(2.718^labelplaces,digits=3)# funcion inversa a la aplicada en la transformacion de los datos
labelvals[ntics]=round(labelvals[ntics]-(labelvals[ntics]*0.001),digits=3)
x<-plot(logr, legend.only=TRUE, col=tim.colors(64),
     legend.width=1, legend.shrink=0.75,
     axis.args=list(at=labelplaces, labels=labelvals, cex.axis=1),legend.args=list(text='', side=4, font=2, line=2.5, cex=0.8))

#return(r)

#close.nc(nc)



