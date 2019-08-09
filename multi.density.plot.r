###############################
## 10 - July - 2019
##  Jose & Oscar - Lab 19 - CIC
##  - Function for building multiple density plots coloured by group
multi.density.plot <- function(df = NULL,groups = NULL,alpha = 0.4,title="Density plot",x.label = "Signal",legend.label = "Groups"){
library(ggplot2)
if(is.null(df)){stop("There is no dataframe.")}
if(is.null(groups)){stop("No groups specified.")}
df <- as.data.frame(df)
colors <- c("#3B9AB2","#6BB1C1","#BDC367","#E6C019","#E49100","#F21A00")
colors <- sample(x = colors,size = length(unique((groups))))
g <- ggplot(data = df)
g <- g + sapply(colnames(df),function(x)geom_density(aes(x=df[,x], fill=groups[x]), alpha=alpha))
g <- g + scale_fill_manual(legend.label, values=colors)+ labs(x=x.label, title=title)
return(g)}
