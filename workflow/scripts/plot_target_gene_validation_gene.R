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

# Create ggplot object for MX1 vs MX2 expression
MX1_MX2 <- ggplot(NULL, aes(x = log2(t(norm_counts[snakemake@config[["target_gene"]],]+1)[which(clindata[[snakemake@config[["disease_status"]]]]==snakemake@config[["disease_condition"]] & clindata$ct != "Unknown")]),                                 
  y = log2(t(norm_counts[snakemake@config[["validation_gene"]],]+1))[which(clindata[[snakemake@config[["disease_status"]]]]==snakemake@config[["disease_condition"]] & clindata$ct != "Unknown")],
  color = as.integer(clindata$ct[(which(clindata[[snakemake@config[["disease_status"]]]]=="COVID19" & clindata$ct != "Unknown"))]))) +
  geom_point(size = 4, na.rm = TRUE) +  # Scatter plot
  scale_color_gradientn(colours=c("red","white","blue"), name = "Viral load (ct)") +  # Color gradient scale
  ylab("MX2 expression RNA-seq \n log2 (norm counts +1)") +  # Y-axis label
  xlab("MX1 expression RNA-seq \n log2 (norm counts +1)") +  # X-axis label
  theme(legend.position = "bottom") +  # Legend position
  theme_bw() +  # Black and white theme
  theme(axis.text = element_text(size = 15),  # Axis text size
        axis.title = element_text(size = 15),  # Axis title size
        plot.title = element_text(size = 25))  # Plot title size

# Render the plot
MX1_MX2
