Readme.txt of SOCIB Repository Management Application
Created by Diego �lvarez Berastegui and Carlos Trenc Espa�ol
July-2018.

To execute this software, it is neccesary internet connection and install in your computer the next open source programs:



1. R. Last version is 3.5.1. You can download it from the url:

	https://www.r-project.org/

2. RStudio Desktop. Last version is 1.1.456. You can download it from the url:

	https://www.rstudio.com/products/rstudio/download/

Once they are installed, to initialize, load all neccesary libraries and execute the software, follow next steps:

1. Open the file ini.R with RStudio and execute it. 

2. Open the file server.R, find the line 1645 and change the default path to user path.

3. Execute server.R file in Run App mode. Default user/password is c/c.



library(shinyFiles)
library(shiny)
library(shinyjs)
library(iterators)
library(markdown)
library(stringr)
library(lubridate)
library(shinythemes)
library(DT)
library(ggplot2)
library(reshape2)
library(raster)
library(ncdf4)
library(RNetCDF)
library(maptools)
library(dismo)
library(fields)
library(jpeg)
library(chron)
library(RColorBrewer)
library(lattice)
