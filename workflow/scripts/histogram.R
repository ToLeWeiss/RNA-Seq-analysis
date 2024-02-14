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

# Read raw counts data
raw_counts <- read.table(snakemake@input[[3]], header = TRUE, sep = "\t")
raw_counts <- as.matrix(raw_counts)

# Output to PDF
pdf(snakemake@output[[1]])

# Find common gene names between clinical data and raw counts
common_names <- intersect(rownames(clindata), colnames(raw_counts))
clindata <- clindata[rownames(clindata) %in% common_names,]
raw_counts <- raw_counts[, colnames(raw_counts) %in% common_names]

# See how many genes per sample have 0 reads
zero <- colSums(norm_counts == 0)/nrow(norm_counts)
hist(zero, breaks = 50)
abline(v = 0.7, col="red")
summary(zero)

# Select only those samples with less than 70% of genes with zero reads
good_samples <- zero < 0.7
norm_counts <- norm_counts[, good_samples]
