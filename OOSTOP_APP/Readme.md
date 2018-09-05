Readme.txt of OOSTOP data adquisition Application
Created by Carlos Trenc Español and Diego Álvarez Berastegui
December-2017.

A tool of the "Operational Oceanography for Sustainability and Conservation of Marine Top Predators (OOSTOP)"


This shoftware is one of the results from the OOSTOP IMBER/CLIOTOP task team https://oostop.wixsite.com/oostop Coordinated by SOCIB (www.socib.es). It facilitates accesing operational oceanography data from relevant servers. First version is focused on data from COPERNICUS.
NExt version will include models from SOCIB 


Screenshot of the wellcome page

![alt text](https://github.com/D-Alvarez-Berastegui/Operational_Fisheries_Oceanography/blob/master/OOSTOP_APP/welcome.png)


Screenshot of the selection data tool

![alt text](https://github.com/D-Alvarez-Berastegui/Operational_Fisheries_Oceanography/blob/master/OOSTOP_APP/selection.png)


Screenshot of the data plot tool

![alt text](https://github.com/D-Alvarez-Berastegui/Operational_Fisheries_Oceanography/blob/master/OOSTOP_APP/plots.png)




--------------------------------------
To execute this software, it is neccesary internet connection and install in your computer the next open source programs:


1. R. Last version is 3.5.1. You can download it from the url:

	https://www.r-project.org/

2. RStudio Desktop. Last version is 1.1.456. You can download it from the url:

	https://www.rstudio.com/products/rstudio/download/

Once they are installed, to initialize, load all neccesary libraries and execute the software, follow next steps:

1. Open the file ini.R with RStudio and execute it. 

2. Open the file server.R, find the line 1645 and change the default path to user path.

3. Execute server.R file in Run App mode. Default user/password is c/c.
