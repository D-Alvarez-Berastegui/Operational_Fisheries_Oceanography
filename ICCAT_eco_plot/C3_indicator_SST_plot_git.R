###########################################################################################################
# create plot of scaled mean temperatures in an area, following format of the ICCAT ecosystem report card
#
# 2018
# Diego Alvarez-Berastegui
# ICTS-SOCIB (www.socib.es)
# 
#########################################################################################################


#### clean objects
rm(list=ls(all=TRUE))

#### specify title of the plot
Indicator_name = "title of the plot"


### dependencies
library(ggplot2)
library(data.table)

### location and name of the output table from c2 code.
inputfilename="  specify the input file folder/name   "
t1=read.csv(file=inputfilename, header = T, sep=";",as.is=T)


t2=t1[,c(1,2)]
names(t2)=c("Year","SST_MEAN");

IndData = data.table(t2)

str(IndData)

IndData = melt.data.table(IndData,id.vars = "Year", variable.name = "Indicator", value.name = "Value")

# Scale
IndData[,Value:=scale(Value),Indicator]
```

DATAobj = IndData[Indicator%in%c("SST_MEAN")] # add or remove names to plot a different subset

ini=as.numeric(DATAobj[1,1])
end=as.numeric(DATAobj[nrow(DATAobj),1])


# These names should match the columns in the csv file!




xtics=seq(from=ini, to =end,by=4)

# This plots all the indicators. To plot a subset, make the change in the first line of this chunk

IndPlot =ggplot(DATAobj, aes(x=Year,y=Value)) +geom_line() + ylab("") + xlab("") +
 scale_x_continuous(breaks = c(xtics,2016))+
  geom_hline(yintercept = c(1,-1), col="dark green") + 
  geom_hline(yintercept = 0, col="dark green",lty="dashed") + 
  theme_bw() + geom_point() + 
  geom_point(data=DATAobj[Value>=1], aes(x=Year,y=Value),col="orange",size=2) +
  geom_point(data=DATAobj[Value<=-1], aes(x=Year,y=Value),col="blue", size=2) + 
  geom_rect(data=DATAobj[Year>max(Year)-5],aes(xmin=min(Year)-.5, xmax= max(Year)+.5, ymin=-1, ymax=1),alpha=.08, fill="dark green") +
  geom_smooth(data=DATAobj[Year>max(Year)-5], aes(x=Year, y=Value),method = "lm", col="red", se=F,alpha=.5) +
  ggtitle(Indicator_name) +
  theme(strip.background=element_rect(fill="white",colour = "white"),strip.text=element_text(hjust=0),
panel.border=element_blank(),axis.line.y=element_line(colour = "black"))
```

dev.new(width=14, height=4.5)
IndPlot
