Script Description
==================

This R script utilizes the `factoextra` library to perform Principal Component Analysis (PCA) on gene expression data and visualize the results.

1. **Output to PDF:**
   - Redirects output to a PDF file specified in the Snakemake output.

2. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.

3. **PCA:**
   - Performs PCA on the log2-transformed normalized counts data, focusing on specific target genes (`target_gene`, `validation_gene`, `validation_gene1`, "TMPRSS2", "HMOX1").
   - Scales the data during PCA.

4. **Visualization:**
   - Generates a biplot visualization of the PCA results using `fviz_pca_biplot`.
   - Colors points based on disease status from the clinical data (`disease_status`).
   - Adds ellipses to visualize group dispersion.
   - Sets a custom palette for colors.
   - Provides a title for the plot.

5. **Output:**
   - Saves the PCA biplot visualization as a PDF file specified in the results directory.
