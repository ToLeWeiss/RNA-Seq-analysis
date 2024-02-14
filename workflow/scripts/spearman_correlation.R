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
    header = TRUE,
    row.names = 1
)

# Compute Spearman correlation between target and validation genes
MX1_MX2stat <- cor.test(
    unlist(norm_counts[snakemake@config[["target_gene"]],][which(clindata[[snakemake@config[["disease_status"]]]]==snakemake@config[["disease_condition"]])]),
    unlist(norm_counts[snakemake@config[["validation_gene"]],][which(clindata[[snakemake@config[["disease_status"]]]]==snakemake@config[["disease_condition"]])]),
    method = "spearman"
)

MX1_MX2stat


