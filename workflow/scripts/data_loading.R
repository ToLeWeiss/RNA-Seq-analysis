data <- getGEO(GEO = snakemake@config[["geo_dataset"]])

head(data)
head(data$GSE152075_series_matrix.txt.gz@phenoData@data[,c(1,2,8,40,39,42)])

####

clindata <- data[["GSE152075_series_matrix.txt.gz"]]@phenoData@data
head(clindata[,c(1,2,8,40,39,42)])

write.csv(clindata, snakemake@output[[1]])


####

raw_counts <- read.delim(snakemake@input[[1]], stringsAsFactors=FALSE, sep = " ")
head(raw_counts[,c(1:10)])


