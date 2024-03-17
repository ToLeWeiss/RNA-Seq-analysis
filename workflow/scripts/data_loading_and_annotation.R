library(GEOquery)
library(DESeq2)

logfile <- file(snakemake@log[[1]], "w")
# Redirect warnings messages and errors to the log file
sink(logfile, type = "message")

# Retrieve data from GEO database
data <- getGEO(GEO = snakemake@config[["geo_dataset"]])

# Extract clinical data from the GEO dataset
clindata <- data[["GSE152075_series_matrix.txt.gz"]]@phenoData@data

if (toupper(snakemake@config[["is_raw_data_locally"]]) == FALSE) {
   # Get raw counts data from GEO database
   dataset <- snakemake@config[["geo_dataset"]]
   # Generate the url for the raw counts of the specified dataset
   url <- sprintf(
      "https://www.ncbi.nlm.nih.gov/geo/download/?acc=%s&format=file&file=%s_raw_counts_GEO.txt.gz",
      dataset, dataset
   )
   # Generate the saving directory thats specified in the config.yaml extended by a directory named 
   # by the dtatset id.
   saving_directory <- paste(
      snakemake@config[["raw_data_saving_dir"]],
      "/",
      dataset,
      sep = ""
   )
   # Check if the saving directory is available
   if (!dir.exists(saving_directory)) {
      dir.create(saving_directory, recursive = TRUE)
   }
   raw_reads_filepath <- paste(saving_directory, "/", "raw_reads.gz", sep = "")
   # Download the raw counts data to {saving_directory}/{dataset}/raw_counts.gz
   download.file(url, raw_reads_filepath)
   # Read raw count data from file
   raw_counts <- read.delim(raw_reads_filepath,
      stringsAsFactors = FALSE,
      sep = " "
   )
} else {
   # If the data is provided locally then read the local file
   raw_counts <- read.delim(snakemake@config[["local_raw_data_path"]],
      stringsAsFactors = FALSE,
      sep = " "
   )
}

# Convert raw counts to matrix
raw_counts <- as.matrix(raw_counts)

# Check if row names of clinical data are in column names of raw counts
rownames(clindata) <- clindata$title
all(rownames(clindata) %in% colnames(raw_counts))

# Check if column names of raw counts are in row names of clinical data
all(colnames(raw_counts) %in% rownames(clindata))

# Rename columns in clinical data
colnames(clindata)[colnames(clindata) == "sequencing_batch:ch1"] <- "batch"
clindata$batch <- as.factor(clindata$batch)
colnames(clindata)[colnames(clindata) == snakemake@config[["data_ct_column_name"]]] <- "ct"
colnames(clindata)[colnames(clindata) == snakemake@config[["data_positivity_column_name"]]] <- "positivity"

# Update disease status in clinical data
clindata[[snakemake@config[["disease_status"]]]][clindata[[snakemake@config[["disease_status"]]]] == "pos"] <- snakemake@config[["disease_condition"]]
clindata[[snakemake@config[["disease_status"]]]][clindata[[snakemake@config[["disease_status"]]]] == "neg"] <- snakemake@config[["health_condition"]]
clindata[[snakemake@config[["disease_status"]]]] <- as.factor(clindata[[snakemake@config[["disease_status"]]]])

# Create DESeqDataSet object
dds <- DESeqDataSetFromMatrix(
   countData = raw_counts,
   colData = clindata,
   design = ~ positivity + batch
)

# Estimate size factors
dds <- estimateSizeFactors(dds)

# Normalize counts
norm_counts <- counts(dds, normalized = TRUE)

# Categorize viral load
clindata$viral_load <- clindata$ct
clindata$viral_load[clindata$viral_load == "N/A"] <- "Negative"
clindata$viral_load[clindata$viral_load > 24 & clindata$viral_load != "Unknown" & clindata$viral_load != "Negative"] <- "LOW"
clindata$viral_load[clindata$viral_load <= 24 & clindata$viral_load >= 19] <- "MEDIUM"
clindata$viral_load[clindata$viral_load < 19] <- "HIGH"
clindata$viral_load <- as.factor(clindata$viral_load)
clindata$viral_load <- factor(clindata$viral_load, levels = c("Negative", "LOW", "MEDIUM", "HIGH", "Unknown"))

# Update disease status factor levels
clindata[[snakemake@config[["disease_status"]]]] <- factor(clindata[[snakemake@config[["disease_status"]]]], levels = c(snakemake@config[["health_condition"]], snakemake@config[["disease_condition"]]))

# Stratify age
clindata$age_cat <- clindata$`age:ch1`
clindata$age_cat[clindata$`age:ch1` < 30] <- "< 30"
clindata$age_cat[clindata$`age:ch1` >= 30 & clindata$`age:ch1` < 40] <- "30s"
clindata$age_cat[clindata$`age:ch1` >= 40 & clindata$`age:ch1` < 50] <- "40s"
clindata$age_cat[clindata$`age:ch1` >= 50 & clindata$`age:ch1` < 60] <- "50s"
clindata$age_cat[clindata$`age:ch1` >= 60 & clindata$`age:ch1` < 70] <- "60s"
clindata$age_cat[clindata$`age:ch1` >= 70] <- "70+"
clindata$age_cat[clindata$`age:ch1` == "Unknown"] <- NA

# Write normalized counts and clinical data to output files
write.csv(norm_counts, snakemake@output[[1]])
write.csv(clindata, snakemake@output[[2]])

# Write raw counts to output file
write.table(raw_counts,
   file = snakemake@output[[3]],
   sep = "\t",
   row.names = FALSE
)
