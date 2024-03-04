Script Description
==================

This R script generates a scatter plot using `ggplot2` library to visualize the expression levels of two genes (`MX1` and `MX2`) from normalized counts data, stratified by viral load (cycle threshold, ct) in clinical data.

1. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.
   
2. **Data Processing:**
   - Extracts gene expression values for `MX1` and `MX2` genes from the normalized counts data.
   - Filters the data based on disease status (COVID19) and removes samples with unknown viral load (ct).
   
3. **Visualization:**
   - Constructs a scatter plot with `MX1` expression on the x-axis and `MX2` expression on the y-axis.
   - Colors the points based on viral load (ct), creating a gradient scale from red to blue.
   - Labels the axes and adjusts text sizes for better readability.
   - Sets the legend at the bottom and applies a black and white theme to the plot.
   
4. **Output:**
   - Saves the plot as a PDF file specified in the Snakemake output.
