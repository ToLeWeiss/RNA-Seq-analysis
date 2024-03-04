Script Description
==================

This R script reads normalized counts data, clinical data, and raw counts data from specified files in the Snakemake input. It then performs data preprocessing and quality control steps.

1. **Data Input:**
   - Reads normalized counts data, clinical data, and raw counts data from CSV and TSV files specified in the Snakemake input.

2. **Data Preprocessing:**
   - Identifies common gene names between clinical data and raw counts data.
   - Filters both clinical data and raw counts data to include only common genes.
   - Calculates the proportion of genes per sample with zero reads.
   - Plots a histogram of zero read proportions per sample and adds a vertical line at 70%.
   - Provides a summary of zero read proportions.

3. **Quality Control:**
   - Selects only samples with less than 70% of genes having zero reads.
   - Filters the normalized counts data to include only samples passing the quality control criteria.

4. **Output:**
   - Saves the histogram plot to a PDF file specified in the Snakemake output.
