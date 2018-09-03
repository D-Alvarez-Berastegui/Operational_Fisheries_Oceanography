#2017/05/03 creoa un raster desde la chla de my ocean updated for rnetcdf library


chlamyoceantoraster=function(ncdf4)
{
  library(ncdf4)
  #library(RNetCDF)  
  nc=nc_open(ncdf4)
  namevariable <- names(nc[['var']])
  names<-names(nc[['dim']])
  if('latitude' %in% names){
    lat = ncvar_get( nc, "latitude") 
  }else{
    lat = ncvar_get( nc, "lat") 
  }
  
  if('longitude' %in% names){
    lon = ncvar_get( nc, "longitude") 
  }else{
    lon = ncvar_get( nc, "lon")
  }
  
  varget = ncvar_get( nc,namevariable)   # variabl
  #construct a transposed 2D matrix with data to plot. This command is a key to create a format that the library raster can read correctly.
  m2 <- t(varget)[1:ncol(varget),]
  #create a raster object with the 2D matrix and give it the projection information
  library(raster)
  r <- raster(m2, xmn=min(lon), xmx=max(lon), ymn=min(lat),ymx=max(lat),crs="+proj=longlat +datum=WGS84")
  return(r)
  
  nc_close(nc)
  
}

