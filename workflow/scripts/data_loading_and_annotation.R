library(GEOquery)
library(DESeq2)

####
data <- getGEO(GEO = snakemake@config[["geo_dataset"]])

head(data)
head(data$GSE152075_series_matrix.txt.gz@phenoData@data[,c(1,2,8,40,39,42)])

####

clindata <- data[["GSE152075_series_matrix.txt.gz"]]@phenoData@data



####

raw_counts <- read.delim(snakemake@input[[1]], stringsAsFactors=FALSE, sep = " ")

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

####

dds <- DESeqDataSetFromMatrix(countData = raw_counts,
                              colData = clindata,
                              design = ~ positivity + batch)


####

dds <- estimateSizeFactors(dds)

####

norm_counts <- counts(dds, normalized=TRUE)

####

clindata$viral_load <- clindata$ct
clindata$viral_load[clindata$viral_load == "N/A"] <- "Negative"
clindata$viral_load[clindata$viral_load > 24 & clindata$viral_load != "Unknown" & clindata$viral_load != "Negative"] <- "LOW"
clindata$viral_load[clindata$viral_load <= 24 & clindata$viral_load >= 19] <- "MEDIUM"
clindata$viral_load[clindata$viral_load < 19] <- "HIGH"
clindata$viral_load <- as.factor(clindata$viral_load)
clindata$viral_load <- factor(clindata$viral_load, levels = c("Negative", "LOW", "MEDIUM", "HIGH", "Unknown"))
clindata$positivity <- factor(clindata$positivity, levels = c("HEALTHY", "COVID19"))

#stratify age
clindata$age_cat <- clindata$`age:ch1`
clindata$age_cat[clindata$`age:ch1` < 30] = "< 30"
clindata$age_cat[clindata$`age:ch1` >= 30 & clindata$`age:ch1` < 40] ="30s"
clindata$age_cat[clindata$`age:ch1` >= 40 & clindata$`age:ch1`< 50] ="40s"
clindata$age_cat[clindata$`age:ch1` >= 50 & clindata$`age:ch1` < 60] ="50s"
clindata$age_cat[clindata$`age:ch1` >= 60 & clindata$`age:ch1` < 70] ="60s"
clindata$age_cat[clindata$`age:ch1` >= 70] ="70+"
clindata$age_cat[clindata$`age:ch1` == "Unknown"] = NA

write.csv(norm_counts, snakemake@output[[1]])
write.csv(clindata, snakemake@output[[2]])

write.table(raw_counts, file = snakemake@output[[3]], sep = "\t", row.names = FALSE)

