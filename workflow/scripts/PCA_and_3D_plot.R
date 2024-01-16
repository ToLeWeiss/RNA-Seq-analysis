library(canvasXpress)
library(factoextra)

pdf(snakemake@output[[1]])
norm_counts <- read.csv(snakemake@input[[1]],
   stringsAsFactors = FALSE,
   na.strings = c("NA", "", "undefined"),
   header = TRUE,
   row.names = 1
)

clindata <- read.csv(snakemake@input[[2]],
    stringsAsFactors = FALSE,
    na.strings = c("NA", "", "undefined"),
    header = TRUE,
    row.names = 1
    )

MX1_MX2stat <-cor.test(unlist(norm_counts["MX1",]  
                       [which(clindata$positivity=="COVID19")]),
                       unlist(norm_counts["MX2",]
                       [which(clindata$positivity=="COVID19")]),
                       method = "spearman")

MX1_MX2stat

#####

res.pca <- prcomp(t(log2(norm_counts[c("MX1","MX2","ACE2","TMPRSS2","HMOX1"),]+1)), 
                  scale = TRUE)

#####
{
   p<- fviz_pca_biplot(res.pca, col.ind = clindata$positivity,
                    geom = "point",
                    addEllipses = TRUE, 
                    palette = c('#F8766D', '#00BFC4'), 
                    title='Principal Component Analysis')
   p
}


#####

table_3Dplot <- cbind(t(log2(norm_counts[c("MX1","ACE2","BSG"),]+1)), as.data.frame(clindata$positivity))
colnames(table_3Dplot)[4] <- "positivity"

canvasXpress(
  data=t(log2(norm_counts[c("MX1","ACE2","BSG"),]+1)),
  varAnnot=as.data.frame(clindata$positivity, row.names=rownames(clindata)),
  axisTickScaleFontFactor=0.6,
  axisTitleScaleFontFactor=0.6,
  ellipseBy="clindata$positivity",
  colorBy="clindata$positivity",
  colorKey=list("clindata$positivity"=list("pos"="#F8766D", "neg"="#00BFC4")),
  graphType="Scatter3D",
  title="3D scatter plot",
  xAxis=list("ACE2"),
  yAxis=list("BSG"),
  zAxis=list("MX1"),
  showLoessFit = FALSE)

