Script Description
==================

This R script utilizes the `canvasXpress` library to create a 3D scatter plot visualization of gene expression data and clinical variables.

1. **Output to PDF:**
   - Redirects output to a PDF file specified in the Snakemake output.

2. **Data Input:**
   - Reads normalized counts data and clinical data from CSV files specified in the Snakemake input.

3. **Data Preparation:**
   - Combines gene expression data and clinical variables into a format suitable for 3D plotting.

4. **3D Scatter Plot Creation:**
   - Constructs a 3D scatter plot using `canvasXpress`.
   - Uses log2-transformed normalized counts data for plotting.
   - Assigns clinical data as variable annotations.
   - Specifies axis labels and titles.
   - Colors data points based on disease status, with customizable color keys.
   - Sets graph type to "Scatter3D".
   - Optionally includes ellipses to visualize group dispersion.
   - Disables loess fit visualization.
   
5. **Output:**
   - Saves the 3D scatter plot visualization as a PDF file specified in the Snakemake output.
