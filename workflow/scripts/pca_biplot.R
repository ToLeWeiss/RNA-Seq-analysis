library(factoextra)

# Output to PDF
pdf(snakemake@output[[1]])

# Read normalized counts data
norm_counts <- read.csv(snakemake@input[[1]],
   stringsAsFactors = FALSE,
   na.strings = c("NA", "", "undefined"),
   header = TRUE,
   row.names = 1
)

# Read clinical data
clindata <- read.csv(snakemake@input[[2]],
   stringsAsFactors = FALSE,
   na.strings = c("NA", "", "undefined"),
   header = TRUE,
   row.names = 1
)

# Perform PCA
res.pca <- prcomp(t(log2(norm_counts[c(snakemake@config[["target_gene"]],snakemake@config[["validation_gene"]],snakemake@config[["validation_gene1"]],"TMPRSS2","HMOX1"),]+1)),
   scale = TRUE)

# PCA biplot visualization
p<- fviz_pca_biplot(res.pca, col.ind = clindata[[snakemake@config[["disease_status"]]]],
   geom = "point",
   addEllipses = TRUE, 
   palette = c('#F8766D', '#00BFC4'), 
   title='Principal Component Analysis')
p
