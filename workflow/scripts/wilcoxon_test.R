library(clinfun)
library(GGally)

# Redirect output to the specified file
sink(snakemake@output[[1]])

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

# Perform Wilcoxon rank sum test for MX1 gene
MX1stat <- wilcox.test(
    unlist(norm_counts[snakemake@config[["target_gene"]],]) ~
    clindata[[snakemake@config[["disease_status"]]]],
    paired = FALSE
)

# Print the Wilcoxon test result
MX1stat
