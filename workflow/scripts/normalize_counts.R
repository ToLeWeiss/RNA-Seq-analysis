####

dds <- read.csv(snakemake@input[[1]])

dds <- estimateSizeFactors(dds)
head(dds)


####

norm_counts <- counts(dds, normalized=TRUE)
head(norm_counts[,c(1:10)])

####

write.csv

