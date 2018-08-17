
##   2017/01/17 R FUNCTION to download one day  data from MFS temperature at specific geo area and depth. Save as NetCDF format
# Diego Alvarez-Berastegui
# www.socib.es
# This function for R software needs phyton MOTUclient, read intruction at: http://forum.marine.copernicus.eu/discussion/148/how-to-use-the-motu-client-with-myocean-data-resolved/p1
# a Full description of the data set can be found at: http://marine.copernicus.eu/services-portfolio/access-to-products/?option=com_csw&view=details&product_id=MEDSEA_REANALYSIS_PHYS_006_004

#product="MEDSEA_REANALYSIS_PHYS_006004-TDS"
# mydate="your date of interest" 
# user="your user at copernicus"
# passw="your password at copernicus"
# ymax= value of the northern bounding box
# ymin=value of the Southern bounding box
# xmax= value of the Eastern bounding box
# xmin=value of the Western bounding box
# zmin=11.5588.. value of the selected depth (one of MFS layers)
# zmax=11.5586...same as zmax for on depth layer only
# example: 
# getMFS_reanalyses_singlefile (mydate,user,passw,ymax,ymin,xmax,xmin,zmax,zmin)
# 

getMFS_reanalyses_singlefile=function(myproduct,mydate,user,passw,ymax,ymin,xmax,xmin,zmax,zmin){

rm(mycom0)
mycom0=paste("C:/Python27/python D:/AAD_2/software/MOTUclient/motu-client-python/motu-client.py
 --user ",user,"
 --pwd ",passw,"
 --motu http://cmems-med-mfc.eu/motu-web/Motu
 --service-id MEDSEA_REANALYSIS_PHYS_006_004-TDS 
 --product-id sv03-med-ingv-tem-rean-d 
 --longitude-min ",xmin," 
 --longitude-max ",xmax," 
 --latitude-min ",ymin," 
 --latitude-max ",ymax," 
 --date-min \"",mydate,"\" 
 --date-max \"",mydate,"\" 
 --depth-min ",zmin,"
 --depth-max ",zmax,"
 --variable votemper 
 --out-dir d:/tempfiles 
 --out-name",mydate,"MFS_BAL.nc",sep="")
rm(mycom1)
mycom1=strwrap(mycom0,width=10000, simplify=TRUE)
system(mycom1)
}



