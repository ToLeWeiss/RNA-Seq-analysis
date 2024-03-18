library(ggplot2)

# Output to PDF
pdf(snakemake@output[[1]])

# Read normalized counts data
norm_counts <- read.csv(snakemake@input[[1]],
   stringsAsFactors = FALSE,
   na.strings = c("NA", "", "undefined"),
   header = TRUE,
   row.names = 1
)

# Read clinical data
clindata <- read.csv(snakemake@input[[2]],
    stringsAsFactors = FALSE,
    na.strings = c("NA", "", "undefined"),
    header = TRUE
)

# Create ggplot object for MX1 expression
MX1 <- ggplot(NULL, aes(x=clindata[[snakemake@config[["disease_status"]]]], y=log2(t(norm_counts[snakemake@config[["target_gene"]],]+1)))) +
   geom_jitter(aes(shape=clindata[[snakemake@config[["disease_status"]]]], color=clindata[[snakemake@config[["disease_status"]]]]), size=3)+
   xlab(NULL) +
   ylab("MX1 expression \n log2 (norm counts +1)") +
   theme(legend.position = "bottom") +
   theme_bw() +
   theme(axis.text = element_text(size = 15),
      axis.title = element_text(size = 15),
      plot.title =element_text(size = 25),
      legend.position = 'none') +
   stat_summary(fun=mean,
      geom="point",
      shape= '_',
      size=14,
      colour= c('#b53d35', '#066e70'))
MX1

