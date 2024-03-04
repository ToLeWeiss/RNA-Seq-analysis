Script Description
==================

This R script utilizes the `clinfun` and `GGally` libraries to perform statistical analysis of clinical and gene expression data.

1. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.

2. **Wilcoxon Rank Sum Test:**
   - Performs a Wilcoxon rank sum test using the `wilcox.test` function to compare the expression levels of a target gene (`target_gene`) between two groups defined by disease status (`disease_status`) from the clinical data.
   - Conducts a two-sided test by default, assessing whether the median expression levels differ between the two groups.
   - Assumes independent samples between groups.

3. **Output:**
   - Redirects the output to the specified file in the Snakemake output, presenting the results of the Wilcoxon rank sum test, including the test statistic, p-value, and alternative hypothesis.
