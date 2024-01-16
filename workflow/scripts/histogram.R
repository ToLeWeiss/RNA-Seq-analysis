
norm_counts <- read.csv(snakemake@input[[1]],
    stringsAsFactors = FALSE,
    na.strings = c("NA", "", "undefined"),
    header = TRUE,
    row.names = 1
    )

clindata <- read.csv(snakemake@input[[2]],
    stringsAsFactors = FALSE,
    na.strings = c("NA", "", "undefined"),
    header = TRUE
    )

raw_counts <- read.table(snakemake@input[[3]], header = TRUE, sep = "\t")
raw_counts <- as.matrix(raw_counts)

pdf(snakemake@output[[1]])
###########  troubleshootuing
common_names= intersect(rownames(clindata), colnames(raw_counts))
clindata = clindata[rownames(clindata) %in% common_names,]
raw_counts = raw_counts[, colnames(raw_counts) %in% common_names]


######## cdownload reads

url="https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE152075&format=file&file=GSE152075%5Fraw%5Fcounts%5FGEO%2Etxt%2Egz"
download.file(url, "raw_reads.gz")

raw_counts <- read.delim("raw_reads.gz", stringsAsFactors=FALSE, sep = " ")



#see how many genes per sample have 0 reads

zero <- colSums(norm_counts == 0)/nrow(norm_counts)

hist(zero, breaks = 50)

abline(v = 0.7, col="red")

summary(zero)


#select only those samples with less than 70% of genes with zero

good_samples <- zero <0.7

norm_counts <- norm_counts[,good_samples]
