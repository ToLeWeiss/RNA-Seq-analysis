Script Description
==================

This R script computes the Spearman correlation coefficient between the expression levels of a target gene (`target_gene`) and a validation gene (`validation_gene`) within a specific disease condition specified in the clinical data.

1. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.

2. **Spearman Correlation Calculation:**
   - Computes the Spearman correlation coefficient using `cor.test` function between the expression levels of the target gene and the validation gene.
   - Selects expression values of the target gene and the validation gene corresponding to the specified disease condition from the clinical data.

3. **Output:**
   - Redirects the output to the specified file in the Snakemake output, presenting the Spearman correlation coefficient and associated statistical test results.
