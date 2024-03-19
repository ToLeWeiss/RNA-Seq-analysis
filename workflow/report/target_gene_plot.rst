Script Description
==================

This R script utilizes the `ggplot2` library to create a jitter plot visualizing the expression levels of the gene `MX1` across different disease statuses from normalized counts data and clinical data.

1. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.
   
2. **Data Processing:**
   - Extracts expression values for the gene `MX1` from the normalized counts data.
   
3. **Visualization:**
   - Constructs a jitter plot where each point represents the expression level of `MX1` for a sample.
   - Colors and shapes the points based on disease status from the clinical data.
   - Labels the y-axis with the expression of `MX1`.
   - Adjusts text sizes and theme for better readability.
   - Adds a summary point indicating the mean expression for each disease status group.
   - Hides the legend as the disease status is encoded by shape and color.
   
4. **Output:**
   - Saves the plot as a PDF file specified in the Snakemake output.
