#file.create("scripts/heatmaps.R")
#file.edit("scripts/heatmaps.R")
#1. base function: heatmap() ----
#?mtcars
dim(mtcars)
str(mtcars)
head(mtcars)

heatmap(mtcars)
#?heatmap
class(mtcars)

mtcars_matrix <- data.matrix(mtcars) # convert a DF to a numeric matrix
class(mtcars_matrix)

View(mtcars_matrix)

heatmap(mtcars_matrix,
        scale="column")
#light yellow for low values
#dark red for high values
#dendograms tell how comparable the variables are
heatmap(mtcars_matrix,
        scale="column",
        col=hcl.colors(n=15, palette = "viridis", alpha = NULL, rev = FALSE, fixup = TRUE))

#remove dendogram
heatmap(mtcars_matrix,
        scale="column",
        Colv=NA)

#cleanup env
rm(list=ls())

#2. gplots::heatmap.2()----
#install.packages("gplots")
library(gplots)
#?heatmap.2

#import protrien data from web
rawdata <- read.csv("https://raw.githubusercontent.com/ab604/heatmap/master/leanne_testdata.csv")
str(rawdata)
head(rawdata)
View(rawdata)

#cleanup data
rawdata <- rawdata[ , 2:7] # remove superfluous columns
colnames(rawdata) <- c(paste("Control", 1:3, sep = "_"),
                       paste("Treatment", 1:3, sep = "_"))

colnames(rawdata)
