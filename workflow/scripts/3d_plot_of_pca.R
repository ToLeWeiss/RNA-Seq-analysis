library(canvasXpress)

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

# Create 3D plot data
table_3Dplot <- cbind(t(log2(norm_counts[c(snakemake@config[["target_gene"]],snakemake@config[["validation_gene1"]],snakemake@config[["validation_gene2"]]),]+1)), as.data.frame(clindata[[snakemake@config[["disease_status"]]]]))
colnames(table_3Dplot)[4] <- snakemake@config[["disease_status"]]

# Create 3D scatter plot using canvasXpress
chart <- canvasXpress(
  data = t(log2(norm_counts[c(snakemake@config[["target_gene"]],snakemake@config[["validation_gene1"]],snakemake@config[["validation_gene2"]]),]+1)),
  varAnnot=as.data.frame(clindata$positivity, row.names=rownames(clindata)),
  axisTickScaleFontFactor=0.6,
  axisTitleScaleFontFactor=0.6,
  ellipseBy="clindata$positivity",
  colorBy="clindata$positivity",
  colorKey=list("clindata$positivity"=list("pos"="#F8766D", "neg"="#00BFC4")),
  graphType="Scatter3D",
  title="3D scatter plot",
  xAxis = list(snakemake@config[["validation_gene1"]]),
  yAxis = list(snakemake@config[["validation_gene2"]]),
  zAxis = list(snakemake@config[["target_gene"]]),
  showLoessFit = FALSE
)

# NOTE: Not happy with this but would solves the issue of not being able to save the plot
htmlwidgets::saveWidget(chart, snakemake@output[[1]])

