Script Description
==================

This R script utilizes the `clinfun` and `GGally` libraries to generate a pairwise correlation plot for gene expression data and clinical variables.

1. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.

2. **Pairwise Correlation Plot:**
   - Constructs a pairwise correlation plot using `ggpairs` from the `GGally` package.
   - Utilizes log-transformed expression values from the normalized counts data.
   - Selects specific genes (`target_gene`, `validation_gene`, `validation_gene1`, and `TMPRSS2`) and includes them in the plot.
   - Colors and shapes the points based on disease status from the clinical data.
   - Sets the alpha level to 0.01 for transparency.
   - Calculates Spearman correlation coefficients between pairs of variables.
   - Presents correlations for continuous variables as scatter plots and for discrete variables as box plots.

3. **Output:**
   - Saves the pairwise correlation plot as a PDF file specified in the Snakemake output.
