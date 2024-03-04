Script Description
==================

This R script utilizes the `qpdf` library to combine multiple input PDF files into a single output PDF file.

1. **PDF Combination:**
   - Uses the `pdf_combine` function from the `qpdf` package to merge the input PDF files specified in the Snakemake input into a single output PDF file.
   - Inputs include PDF files from `snakemake@input[[1]]` to `snakemake@input[[8]]`.
   - Outputs the combined PDF file to the location specified in `snakemake@output[[1]]`.
