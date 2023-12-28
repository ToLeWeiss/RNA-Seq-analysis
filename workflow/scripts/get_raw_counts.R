####

raw_counts <- as.matrix(raw_counts) 
rownames(clindata) <- clindata$title
all(rownames(clindata) %in% colnames(raw_counts))
all(colnames(raw_counts) %in% rownames(clindata))


colnames(clindata)[colnames(clindata) == "sequencing_batch:ch1"] <- "batch"
clindata$batch = as.factor(clindata$batch)
colnames(clindata)[colnames(clindata) == "n1_ct:ch1"] <- "ct"
colnames(clindata)[colnames(clindata) == "sars-cov-2 positivity:ch1"] <- "positivity"
clindata$positivity[clindata$positivity == "pos"] <- "COVID19"
clindata$positivity[clindata$positivity == "neg"] <- "HEALTHY"
clindata$positivity = as.factor(clindata$positivity)

head(clindata$positivity)

####

dds <- DESeqDataSetFromMatrix(countData = raw_counts,
                              colData = clindata,
                              design = ~ positivity + batch)

head(dds)

write.csv(dds, snakemake@output[[1]])


