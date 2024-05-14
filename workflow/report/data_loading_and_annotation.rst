Script Description
==================

This R script utilizes the `GEOquery` and `DESeq2` libraries for retrieving gene expression data from the GEO database and performing differential expression analysis.

1. **Data Retrieval:**
   - Retrieves gene expression data from the GEO database specified in the Snakemake configuration using the `getGEO` function.
   
2. **Preprocessing:**
   - Extracts clinical data from the GEO dataset and performs necessary data cleaning and transformation.
   - Checks for consistency between clinical data and raw counts data.
   - Renames columns and updates disease status and viral load categories in clinical data.
   - Stratifies age into categorical groups.
   
3. **Differential Expression Analysis:**
   - Constructs a `DESeqDataSet` object using raw counts data and clinical data.
   - Estimates size factors and normalizes counts using the `DESeq2` package.
   
4. **Output:**
   - Writes normalized counts data and modified clinical data to output CSV files in the tmp directory.
   - Writes raw counts data to a separate output file.
