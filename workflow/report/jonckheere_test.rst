Script Description
==================

This R script utilizes the `clinfun` and `GGally` libraries to perform statistical analysis and visualization of clinical and gene expression data.

1. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.

2. **Jonckheere-Terpstra Trend Test:**
   - Calculates the Jonckheere-Terpstra trend test to assess the trend of gene expression levels (specified target gene) with ordered age categories (age_cat) within a specific disease condition (specified disease status).
   - Utilizes log-transformed expression values from the normalized counts data.
   - Conducts the trend test for the specified disease condition and age categories.
   - Performs 500 permutations to estimate p-value for the trend test.

3. **Output:**
   - Redirects the output to the specified file in the Snakemake output, presenting the results of the Jonckheere-Terpstra trend test.
