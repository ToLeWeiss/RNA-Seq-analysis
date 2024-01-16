library(qpdf)

qpdf::pdf_combine(input = c(
                        snakemake@input[[1]], snakemake@input[[2]], snakemake@input[[3]],
                        snakemake@input[[4]]
                        ),
                   output = snakemake@output[[1]])


