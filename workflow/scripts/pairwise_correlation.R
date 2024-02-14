library(clinfun)
library(GGally)

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
    header = TRUE
)

# Output to PDF
pdf(snakemake@output[[1]])

# Create pairwise correlation plot
pairwise_corr <- ggpairs(
    as.data.frame(log2(t(norm_counts + 1))),
    columns = c(snakemake@config[["target_gene"]], snakemake@config[["validation_gene"]], snakemake@config[["validation_gene1"]], "TMPRSS2"),
    upper = list(
        continuous = wrap('cor', method = "spearman", size = 3),
        combo = "box_no_facet", discrete = "count",
        na = "na"
    ),
    ggplot2::aes(
        colour = clindata[[snakemake@config[["disease_status"]]]],
        shape = clindata[[snakemake@config[["disease_status"]]]],
        alpha = 0.01
    )
)

# Print the pairwise correlation plot
pairwise_corr
