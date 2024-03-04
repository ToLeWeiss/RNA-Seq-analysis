# library(qpdf)
#
# # Combine input PDF files into a single output PDF file
# qpdf::pdf_combine(
#     input = c(
#         snakemake@input[[1]], snakemake@input[[2]], snakemake@input[[3]],  # Input PDF files
#         snakemake@input[[4]], snakemake@input[[5]], snakemake@input[[6]],
#         snakemake@input[[7]], snakemake@input[[8]]
#     ),
#     output = snakemake@output[[1]]  # Output PDF file
# )

library(qpdf)

input_files <- unlist(snakemake@input)

# Combine input PDF files into a single output PDF file
qpdf::pdf_combine(
    input = input_files,
    output = snakemake@output[[1]] # Output PDF file
)

