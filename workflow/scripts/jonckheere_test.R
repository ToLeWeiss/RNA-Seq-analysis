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

# Perform Jonckheere-Terpstra trend test for age
p_trend_age <- jonckheere.test(
    x = log2(t(norm_counts[snakemake@config[["target_gene"]],] + 1))[clindata[[snakemake@config[["disease_status"]]]] == snakemake@config[["disease_condition"]]],
    g = factor(clindata$age_cat[clindata[[snakemake@config[["disease_status"]]]] == snakemake@config[["disease_condition"]]], ordered=TRUE),
    alternative = "decreasing",
    nperm = 500
)

# Print the results
p_trend_age

